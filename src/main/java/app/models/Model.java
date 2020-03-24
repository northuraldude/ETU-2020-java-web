package app.models;

import app.entities.Player;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public class Model {
    private static Model instance = new Model();

    private List<Player> model;

    public static Model getInstance() {
        return instance;
    }

    private Model() {
        model = new ArrayList<>();
    }

    public void add(Player player) {
        model.add(player);
    }

    public List<String> list() {
        return model.stream()
                .map(Player::getName)
                .collect(Collectors.toList());
    }
}
