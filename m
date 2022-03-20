Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 73E054E1E00
	for <lists+linux-rtc@lfdr.de>; Sun, 20 Mar 2022 22:30:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343749AbiCTVcK (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 20 Mar 2022 17:32:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236574AbiCTVcJ (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 20 Mar 2022 17:32:09 -0400
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::222])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C53338793
        for <linux-rtc@vger.kernel.org>; Sun, 20 Mar 2022 14:30:45 -0700 (PDT)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 6E0B140003
        for <linux-rtc@vger.kernel.org>; Sun, 20 Mar 2022 21:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1647811843;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:resent-to:
         resent-from:resent-message-id; bh=eoUvjXcWxsCS2k8VppywzQry5S7nHcH0mW8C42GzOcs=;
        b=nNFCoSv6PBLlSoD3OwQGU9LiQd+mUe+qNno4K5wAeGVLhE4jocrdkI22KOtiS0o3fB4THW
        8AaeJvlNuB5ngO33Hsd8vBCZFI3TS3/G1Hx1VvliundDtg+oZz1auTaNOg1UkldDFs6cxK
        aXYooT/bIqbezNrMbm24iCcMPabQDDtLG5KamGgkQoD/nRRja698Rk1atUH/NtTUphb+p/
        JKs1t8JBGOl/eoV9XzqsjhEea4Lc/PWU4/MycW6RMtFpII9p+f9SelvaTw4TlN21g74g3c
        MGPxkXuAoTSaw8ZPwOqa/ECtbBUFe6POheyG9whCn7l27dBlEv4xUY/O2c8qGA==
Received: by spool.mail.gandi.net (Postfix) with ESMTPS id 5C9F27803EA
        for <alexandre.belloni@bootlin.com>; Sun, 20 Mar 2022 21:09:09 +0000 (UTC)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id CB401240005;
        Sun, 20 Mar 2022 21:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1647810549;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=eoUvjXcWxsCS2k8VppywzQry5S7nHcH0mW8C42GzOcs=;
        b=Kv7mnn6+qhPoe4nYAA3HU8KH96O+5yNpew8NlJqW72ofsz2ognKKCzpo6Ro6Qmuh0o6/Aj
        H4MDHrQTsDpJkXRpoVCIk2lp8hdLr9hgtulZKUNXmaZSGN69vlAfQNW1YX3dp4XAcHNNDa
        RxiykDC3B/+fAfxAf2cA3R3rB8nJDSKPFHKjlVaX80wJOW9I6LPmhdiWYncCdRD9bLhw67
        nnnWmK0oE9guT/rcqjPVCAA8uH0k9ULd+eYSJkTPPKOUFcY0eSQnRwAFDNPtwvm0wJrl4n
        axkoZzjlqM+jistlPqfPumFuC+R63Dc1qnYE6ztCeP6BqNFYwqqFl53dFD2xYA==
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        kernel test robot <lkp@intel.com>, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: [PATCH] clk: sunxi-ng: sun6i-rtc: include clk/sunxi-ng.h
Date:   Sun, 20 Mar 2022 22:09:04 +0100
Message-Id: <20220320210905.6606-1-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass (spool4: domain of bootlin.com designates 217.70.178.230 as permitted sender) client-ip=217.70.178.230; envelope-from=alexandre.belloni@bootlin.com; helo=relay10.mail.gandi.net;
Authentication-Results: spool.mail.gandi.net;
        dkim=pass header.d=bootlin.com header.s=gm1 header.b=Kv7mnn6+;
        spf=pass (spool.mail.gandi.net: domain of alexandre.belloni@bootlin.com designates 217.70.178.230 as permitted sender) smtp.mailfrom=alexandre.belloni@bootlin.com;
        dmarc=pass (policy=reject) header.from=bootlin.com
X-TUID: 5m1n1pcO+G80
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

This solves:
>> drivers/clk/sunxi-ng/ccu-sun6i-rtc.c:334:5: warning: no previous prototype for 'sun6i_rtc_ccu_probe' [-Wmissing-prototypes]
     334 | int sun6i_rtc_ccu_probe(struct device *dev, void __iomem *reg)
         |     ^~~~~~~~~~~~~~~~~~~

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/clk/sunxi-ng/ccu-sun6i-rtc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c b/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
index 712fda22efd5..8a10bade7e0d 100644
--- a/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
+++ b/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
@@ -9,6 +9,8 @@
 #include <linux/module.h>
 #include <linux/of_device.h>
 
+#include <linux/clk/sunxi-ng.h>
+
 #include "ccu_common.h"
 
 #include "ccu_div.h"
-- 
2.35.1

