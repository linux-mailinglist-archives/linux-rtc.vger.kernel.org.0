Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C82A72691A6
	for <lists+linux-rtc@lfdr.de>; Mon, 14 Sep 2020 18:33:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725978AbgINQd0 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 14 Sep 2020 12:33:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726379AbgINPqK (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 14 Sep 2020 11:46:10 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0485FC061788
        for <linux-rtc@vger.kernel.org>; Mon, 14 Sep 2020 08:46:05 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id x14so122496wrl.12
        for <linux-rtc@vger.kernel.org>; Mon, 14 Sep 2020 08:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sm9pgyVCjKyBV5Er2a0jzjZ0ZMas7emW/sq9mlAQQgY=;
        b=UjEICQBL9kukz5pRQFxfaxT47KM/RFb3jOFeEAb16y2GJQDTKa5rV4uNF1vqOkXWgS
         Q7Redj0Permpm1GcK5bbOmbm037wUyaQUTG4d2cNigYPgUqV8Ys/Z4U3yILWEbPPP3Hp
         qhPbd5wPrxHvDr/8Z/mEj08CeQ3tgzMs3sfQumt8A18pYiNNI0dDgJgW0ZPA3nWWkOCD
         cAqgzr1mm5VgnfDRhOdSu/DoFJNMNVlUxkZotipbQ6IL96FrWnYCV3C95sLPtDMlC5tj
         vvZGZvGiOpAHF8pAJM3D0tyBeYupmuY+/kHwDUzrHzkFfYvjNaGOSal8PzT63XxT3TX6
         MXJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sm9pgyVCjKyBV5Er2a0jzjZ0ZMas7emW/sq9mlAQQgY=;
        b=Y1BOTN3NfY4wvospAYARsUndO++lSi7KxzJv3nboy2X22VY10De7SUeqgxxUPKqp+F
         rq3DT39lLMXcfmVyref1mcTtGdvKG/eaRVnq8I4CcKZ+QdrWZ9P1S/l91MC1oOMQhsEU
         E2bXXGyqWt0uXpE30cMhOhyfiyTTwJ6wJvOIN8F+y/2MxQpQMqhrBGHgnHTsKEssi7Ak
         5wXlweoIc67CEpQT3Pezk/C6PnRJ5xAS9vlOCjwUlxuQiZtiA44axwSGbdAcRmNXTSK1
         K2fiGLiRQTBYuhCjjgDQgKzh6LDg1b8ss2pys8SgZEALDOXkb+yA7e/gwlaRNyOnjwKT
         5xIw==
X-Gm-Message-State: AOAM531baEfF79VBi88i8zf7EoR3ZJdpoSZpRN5zr/hFqjLxlomE8b8o
        oAZ4bw9R9AfKyVq64fKx+HYURaww+jAvkA==
X-Google-Smtp-Source: ABdhPJzHu7RPuzJxmb64QTz5Xq34eRNRLo36+mpPi9E5WfOAtnL3Y6jvTGHjS5aTJdiXhiWujX2Q2g==
X-Received: by 2002:a5d:60d0:: with SMTP id x16mr16456632wrt.196.1600098363695;
        Mon, 14 Sep 2020 08:46:03 -0700 (PDT)
Received: from debian-brgl.home (lfbn-nic-1-68-20.w2-15.abo.wanadoo.fr. [2.15.159.20])
        by smtp.gmail.com with ESMTPSA id l19sm19510448wmi.8.2020.09.14.08.46.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2020 08:46:03 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v3 00/14] rtc: rx8010: use regmap instead of i2c smbus API
Date:   Mon, 14 Sep 2020 17:45:47 +0200
Message-Id: <20200914154601.32245-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

This series gets bigger and bigger but I noticed a problem with this
driver that looks like stable material so I fixed it as the first patch
in the series to make backporting easy.

Other than that, there are new refactoring patches and I removed the
unnecessary error messages.

--

I want to use this driver on a platform where the i2c controller doesn't
speak SMBUS. This series converts the driver to i2c regmap which can
figure out the correct protocol to use.

The actual conversion happens in patch 13. The rest are bugfixes and
refactoring.

v1 -> v2:
- s/parentheses/brackets/g
- add a patch switching the driver to using the preferred RTC API
- rework the patch removing magic values
- use range_max and range_min instead of manual range checks
- add a patch adding a helper variable in probe() for client->dev
- add a patch using sizeof(*rx8010) instead of sizeof(struct rx8010_data)

v2 -> v3:
- remove unnecessary error messages when registering the RTC device
- add a patch switching to using the preferred probe_new callback in
  the I2C driver
- add a patch fixing an issue where the global rtc operations struct
  is modified depending on the presence of the interrupt
- add a patch removing a stray newline

Bartosz Golaszewski (14):
  rtc: rx8010: don't modify the global rtc ops
  rtc: rx8010: remove a stray newline
  rtc: rx8010: remove unnecessary brackets
  rtc: rx8010: consolidate local variables of the same type
  rtc: rx8010: use tabs instead of spaces for code formatting
  rtc: rx8010: rename ret to err in rx8010_set_time()
  rtc: rx8010: don't use magic values for time buffer length
  rtc: rx8010: drop unnecessary initialization
  rtc: rx8010: use a helper variable for client->dev in probe()
  rtc: rx8010: prefer sizeof(*val) over sizeof(struct type_of_val)
  rtc: rx8010: switch to using the preferred RTC API
  rtc: rx8010: switch to using the preferred i2c API
  rtc: rx8010: convert to using regmap
  rtc: rx8010: use range checking provided by core RTC code

 drivers/rtc/rtc-rx8010.c | 332 +++++++++++++++++----------------------
 1 file changed, 143 insertions(+), 189 deletions(-)

-- 
2.26.1

