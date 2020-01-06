typealias Room: Int
typealias Dataset = Array<Array<Int>>

/**
 * A data class representing "a split" in a dataset. It translates to "This dataset is split such that the left node is all children with attribute[[attrIndex]] are less than [lessThan]
 */
class Split(val attrIndex: Int, val lessThan: Int) {

    /**
     * Classifies a datapoint as being left (`false`) or right (`true`) of the node with this Split
     */
    fun classify(dataPoint: Datapoint): Boolean {
        // TODO
    }
}


class Node(val left: Node,
           val right: Node,
           val room: Room?, // room is null unless it's a leaf
           val split: Split? // split is only null if it's a leaf
) {
    fun isLeaf(): Boolean {
        return split == null && room != null
    }

    /**
     * Returns the depth of the tree from this node
     */
    fun getDepth(): Int {
        if (room != null) return 0
        else return Math.max(left.getDepth(), right.getDepth())
    }

    fun classify(datapoint): Room
}


class Datapoint(
        val features: Map<Feature, Int>,
        val room: Int? // null if unknown
)

/**
 * Takes a training set and returns a decision tree
 */
fun decisionTree(trainingSet: Dataset): Node {
    if all datapoints have the same room, return Node(room)
    val (split: Split, leftSet: TrainingArray, rightSet: TrainingArray) = getSplit(trainingSet)
    val left = decisionTree(leftSet)
    val right = decisionTree(rightSet)
    val node = Node(left, right, split)

}

/**
 * Returns the best split of a trainingset, with the Split object and the split dataset
 */
fun getSplit(trainingSet): (Split, left: Dataset, right: Dataset) {
    check gain for each attribute
            for greatest gain, split and return the left and right dataset and the Split
}

fun evaluate(testSet: Dataset, tree: Node) {
    /**
     * Do lots of shit
     */
}

/**
 * Takes a training set, validation set, and the root of a decision tree, and prunes it
 */
fun prune(trainingSet: Dataset, validationSet: Dataset, root: Node): Node {
    DFS from root {
        if node is not a leaf, but children are both leaves{
        filter dataset down to this node
                current entropy = entropy by splitting here
        potential entropy = entropy by not splitting here
                if (potential entropy < current entropy) prune.
    }
    }
}

/**
 * Returns where the split would be, and the entropy gain from that split
 * ALex
 */
fun gain(dataset: Dataset, attrInd: Int): (Split, Double)

/**
 * The boring stuff - Gui
 *   - import the dataset
 *   - make it an array, and all dat stuff
 * Create decision tree - Gui/Daniel
 * getSplit - Alex/Daniel
 * gain - Alex
 * prune - Gui
 * evaluate - Marvin
 *  - K-fold - Alex/Gui
 * visualise = Marvin


Next Thursday, we'll go over stuff
 * add parallelized
 * organize files - gui
 * confusion matrix - alex
 * recall - alex
 * precision - alex
 * f1 - alex
 * avg calssification rate - gui
 * k-fold - alex/daniel
 * clean up code - gui/daniel
 * fix tree plotting - marvin/gui
 * comment every function (extensively) - all of us
 * draft report - daniel

 */
