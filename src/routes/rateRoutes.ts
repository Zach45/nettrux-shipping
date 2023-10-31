import express from "express";
import { getRates } from "../controllers/rateControllers";

const router = express.Router();

router.get("/get", getRates);

export default router;
