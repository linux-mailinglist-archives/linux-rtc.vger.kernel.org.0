Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D20C26468E
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Sep 2020 15:07:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730204AbgIJNGX (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 10 Sep 2020 09:06:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727055AbgIJNFE (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 10 Sep 2020 09:05:04 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9DCEC061573
        for <linux-rtc@vger.kernel.org>; Thu, 10 Sep 2020 06:05:00 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id a9so5746301wmm.2
        for <linux-rtc@vger.kernel.org>; Thu, 10 Sep 2020 06:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=G6p9nmKGbXBOFJlaJm/m/zH8eOM0IPKfdB5t8Uf7UlA=;
        b=Z7QXKq9+cHr0Hks+8HPVYqsE/2qjY4vG5NUdQy0VUBicPBaiRpl5FUAEbS1iV3wL0k
         17b7N6D5Ruc2Lnq+9prTTsLtyI90nWrkDqMqgJYjImEJL3bQvlHFuuGlykf6UlZd510O
         iiuebXsi1TJA0unp0mjhcr2o/+DcrEd+K/eHfId7OQnBHnitNJ93oaL3KP21NlTj+n2+
         nQTNPWbKRL2NUKULEbkQki7B8CmoMq30uJKdAPYfvR3KcjUY87PXwLDiBGmw9HVH/e2F
         PXYRWcm0ml7UGEbJTvP3Jt6N2WaF0Ou5vkFr7eAvrzc7ILRDNn0lCaD9cyHiljNpI0n4
         zfCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=G6p9nmKGbXBOFJlaJm/m/zH8eOM0IPKfdB5t8Uf7UlA=;
        b=RMr4cOT/4h0mnbSV/Hz4YluCTU5svpXS0oXgHAri2Y6of38xd4xRK/T8ZV9+o1fA7u
         w11fb0O5BYePQS1SPGxwDq+TflfA0WLUnGj13zyNCRoNT+DCNeQhpVc69pta/auupJ2S
         IRr/Y/32eZ8c9LPPAf3/fKsTqqkymS59hy3u21oCBB/Zj3PaSlWR6+DVQq4D7zUqxY9Z
         EJbbZNxzEiLpp+woO5im6B2uRKbyBwTcjxNp6k2rHA5aIcpWjBm9J/O9HrgJDf105sak
         +JBx+fwKe4ngHteLGk+MBRyr5VuAYzYT01eJEzhAfmzj5Hp51fVAvGs86EvgYkxRQT3R
         QMfw==
X-Gm-Message-State: AOAM533NdrhFYUa3eJ1IKosI0rnTAxGyxBJSsClF9OfsFDxhyYPKn6Rf
        W+W0xAijSyRIt4nH8aw0sF0ecA==
X-Google-Smtp-Source: ABdhPJxUi3e922pita34aArm+ddFZanF95uA8l8B2eYmWmzgwphxpz+co7frH1pXAcbUOaASGZfL1A==
X-Received: by 2002:a1c:408a:: with SMTP id n132mr7974517wma.45.1599743097333;
        Thu, 10 Sep 2020 06:04:57 -0700 (PDT)
Received: from debian-brgl.home (lfbn-nic-1-68-20.w2-15.abo.wanadoo.fr. [2.15.159.20])
        by smtp.gmail.com with ESMTPSA id p16sm9321988wro.71.2020.09.10.06.04.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2020 06:04:56 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v2 00/11] rtc: rx8010: use regmap instead of i2c smbus API
Date:   Thu, 10 Sep 2020 15:04:35 +0200
Message-Id: <20200910130446.5689-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

I want to use this driver on a platform where the i2c controller doesn't
speak SMBUS. This series converts the driver to i2c regmap which can
figure out the correct protocol to use.

The actual conversion happens in patch 10, the rest are just cleanups and
refactoring.

v1 -> v2:
- s/parentheses/brackets/g
- add a patch switching the driver to using the preferred RTC API
- rework the patch removing magic values
- use range_max and range_min instead of manual range checks
- add a patch adding a helper variable in probe() for client->dev
- add a patch using sizeof(*rx8010) instead of sizeof(struct rx8010_data)

--

Alexandre: I believe that the implementation of devm_rtc_allocate_device()
and rtc_register_device() is wrong as I explained under the previous
version of this series. I'll send an RFC that reworks this part soon.

Bartosz Golaszewski (11):
  rtc: rx8010: remove unnecessary brackets
  rtc: rx8010: consolidate local variables of the same type
  rtc: rx8010: use tabs instead of spaces for code formatting
  rtc: rx8010: rename ret to err in rx8010_set_time()
  rtc: rx8010: don't use magic values for time buffer length
  rtc: rx8010: drop unnecessary initialization
  rtc: rx8010: use a helper variable for client->dev in probe()
  rtc: rx8010: prefer sizeof(*val) over sizeof(struct type_of_val)
  rtc: rx8010: switch to using the preferred RTC API
  rtc: rx8010: convert to using regmap
  rtc: rx8010: use range checking provided by core RTC code

 drivers/rtc/rtc-rx8010.c | 306 +++++++++++++++++----------------------
 1 file changed, 131 insertions(+), 175 deletions(-)

-- 
2.26.1

