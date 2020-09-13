Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1552267F76
	for <lists+linux-rtc@lfdr.de>; Sun, 13 Sep 2020 14:27:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725931AbgIMM1B (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 13 Sep 2020 08:27:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725928AbgIMM06 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 13 Sep 2020 08:26:58 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA3B1C061573;
        Sun, 13 Sep 2020 05:26:57 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id x69so10503826lff.3;
        Sun, 13 Sep 2020 05:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yBwjF+DS+vSXsUN7z560qkjK09dNG/GEjVxLhlS0gsE=;
        b=mTlVW06LAGcgI3qiF7857wW+C6dzIpggkwGyE1Eti/jeWEuhBhPEQxk3IdJm8L8sWG
         WCGHdP8CRuvk6ReUGyGdB+DETLyxuOreDRg3I6C0H5gECJcEixTacOjR/KduG9cAALQ4
         aZ7Wd/ivnotRzTDkhMSb7h49p2ePioDGAF8YI3vbXa3ILYsEUM7s5KOlCHlUSWlnpU/r
         JzJZZ1jY9PIC2XGJOoKUaSGxRPT01EroSj8TxLJ+JGhEswSuNIW9Ey+tyclOnyJHoeds
         rQzxtpvrAY4UhNzjmSTQF80JyVtVS0t8eP0wzPza18tqqg932QgK1hjB1R9pjtlikJyJ
         7IhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yBwjF+DS+vSXsUN7z560qkjK09dNG/GEjVxLhlS0gsE=;
        b=JFTPRcbQUcecxWjjbZjOtR8QKTzkpqWWbiOzjF3xRBfWMT6b1ZrzgRv3sV8/taR7J8
         xZrPD/H0NJZoABGUrzTS8ErR72PhBseRPgJyWZah3ZL0h2j1usO02OyhLFBZf1OQCkaV
         185omysukYS3m4E9wugQSjnLJ2TQpiP/fx2Rup7d42X1MfdocW2cuaO8dDwWIepb9wks
         qwsK4UNuk7nTvAwAjbg1ehhZo1NEccxVe57C8ECIIDWjvhCqA5ZJcZ+/iS7xogiAkuil
         EEWej+k793nLcIrUL1soZTED7MUiXauOd3qODMDSnO3wRzv3/nhlwQEabehmpyYxDhkm
         +6mg==
X-Gm-Message-State: AOAM5319s/KxWpjstECZG7BL0r3gly5dj+vqkr/nPji7FffsgSpBqyba
        /1l1RPfyNYK/JyPWr8f0oD8=
X-Google-Smtp-Source: ABdhPJxZa//874cCWJGwIj3/w+A2g7/MREvzhbfPdEeZfg/yeLdI4rI94JROgavmtDtVgPMdyqxbzQ==
X-Received: by 2002:a05:6512:20c3:: with SMTP id u3mr2617579lfr.572.1600000016115;
        Sun, 13 Sep 2020 05:26:56 -0700 (PDT)
Received: from localhost.localdomain (h-82-196-111-59.NA.cust.bahnhof.se. [82.196.111.59])
        by smtp.gmail.com with ESMTPSA id a192sm2638725lfd.51.2020.09.13.05.26.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2020 05:26:55 -0700 (PDT)
From:   Rikard Falkeborn <rikard.falkeborn@gmail.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Patrice Chotard <patrice.chotard@st.com>,
        linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Rikard Falkeborn <rikard.falkeborn@gmail.com>
Subject: [PATCH] rtc: st-lpc: Constify st_rtc_ops
Date:   Sun, 13 Sep 2020 14:26:44 +0200
Message-Id: <20200913122644.35515-1-rikard.falkeborn@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The only usage of st_rtc_ops is to assign its address to the ops field
in the rtc_device struct. which is a const pointer. Make it const to
allow the compiler to put it in read-only memory.

Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>
---
 drivers/rtc/rtc-st-lpc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-st-lpc.c b/drivers/rtc/rtc-st-lpc.c
index 51041dc08af4..0c65448b85ee 100644
--- a/drivers/rtc/rtc-st-lpc.c
+++ b/drivers/rtc/rtc-st-lpc.c
@@ -173,7 +173,7 @@ static int st_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *t)
 	return 0;
 }
 
-static struct rtc_class_ops st_rtc_ops = {
+static const struct rtc_class_ops st_rtc_ops = {
 	.read_time		= st_rtc_read_time,
 	.set_time		= st_rtc_set_time,
 	.read_alarm		= st_rtc_read_alarm,
-- 
2.28.0

