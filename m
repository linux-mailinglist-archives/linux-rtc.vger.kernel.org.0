Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 922E8357A79
	for <lists+linux-rtc@lfdr.de>; Thu,  8 Apr 2021 04:40:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229600AbhDHCkw (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 7 Apr 2021 22:40:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229510AbhDHCku (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 7 Apr 2021 22:40:50 -0400
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com [IPv6:2607:f8b0:4864:20::82a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 771E5C061760
        for <linux-rtc@vger.kernel.org>; Wed,  7 Apr 2021 19:40:38 -0700 (PDT)
Received: by mail-qt1-x82a.google.com with SMTP id h7so372756qtx.3
        for <linux-rtc@vger.kernel.org>; Wed, 07 Apr 2021 19:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aBIAuIQ8pqqfSBLDil/Yx/aWCENej9k7uffDLC1s2rI=;
        b=GvYeJCG5LSOd5lga78nibrE1GHuvIFse7pvOdGnDWhc91PNNDl9H+/qRe4KRjMXn61
         YkypmAlPcCmKbNADYbIWkpXh6z6W7qPb9tldlbEslFrURXPxFKHPWyiOhWI2IS2M3o1/
         sF9pGT2hYT8hzjStlgKPQJ0cqwWbjRGWamX6HCpkt1Q8ougN2bzqE80Mgewdng19SCtr
         mOpfTvMeHSBxvvcWpI2GW9APYe/7l0odsPNh3b3xVZ3U+lX28NvxalXaPRAPOEbKl0Mt
         zNqpTu4vTRc379u4MTYCz5PqarlF5diGqBjHDKd7ZF8FL6Z3toWUI48rAM2S3goOA1ul
         pcyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aBIAuIQ8pqqfSBLDil/Yx/aWCENej9k7uffDLC1s2rI=;
        b=AJ6PFTxq/2duAduuoe8thh8yNePrAD9WLN3Iju44m76FTO7Tkugw2bzW+uBV9bkEzv
         YBLoXPlqSZLrA0dh6UaCR/dX8c8ZqsXOVjej19wjW8fTly/aICRXFKLl+OqwCGSJPp72
         EbCbmyXVpqh0Jl6nqmtIke62lgJMyxD86hqe6JdPy0fpJFJKFw3ysQ5IpIzx8OgiY1F2
         WmBvjR41iAOk6aPYEUK7Tl9iOq7F12b9xSWRBs76PTWsq5nmN0E0DWy/ImiBXhJqfi5W
         49oarOx5fBdlxVeXwMk57ls42OHJyb+zs2GHLzDNzKjqiBOnMIyJyDZyPQXAAUSK3AFj
         fJxA==
X-Gm-Message-State: AOAM5322lSkAYloNSK7fMLoQZIGtdoUBXGbETr8tguTw8CgH4THn37S2
        1QUkOmITzMgnshIDkQ6YEvcAGsqhsImKaW9j
X-Google-Smtp-Source: ABdhPJxq6ujq3pKCmoOtkzyCryblSKQ5g2qwMuo8yUss6IqHJkRMKgAI/ZAklYbr73vZz5C9nTw8Aw==
X-Received: by 2002:a05:622a:1744:: with SMTP id l4mr5574004qtk.75.1617849637744;
        Wed, 07 Apr 2021 19:40:37 -0700 (PDT)
Received: from shaak.xiphos.ca (198-48-202-89.cpe.pppoe.ca. [198.48.202.89])
        by smtp.gmail.com with ESMTPSA id v128sm20102383qkc.127.2021.04.07.19.40.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Apr 2021 19:40:37 -0700 (PDT)
From:   Liam Beguin <liambeguin@gmail.com>
To:     liambeguin@gmail.com, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, panfilov.artyom@gmail.com
Cc:     linux-rtc@vger.kernel.org
Subject: [PATCH v2 0/3] add alarm support for the rtc-ab-eoz9
Date:   Wed,  7 Apr 2021 22:40:25 -0400
Message-Id: <20210408024028.3526564-1-liambeguin@gmail.com>
X-Mailer: git-send-email 2.30.1.489.g328c10930387
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Liam Beguin <lvb@xiphos.com>

Add alarm support for the rtc-ab-eoz9.

The board used to test this series has the interrupt line of the RTC
connected to a circuit controlling the power of the board.

An event on the interrupt line while the board is off will power it on.
Because of these hardware limitations, the irq handler added in this
patch wasn't fully tested.

The alarm functionality was tested, with:

	$ date "2010-10-10 10:10"
	Sun Oct 10 10:10:00 UTC 2010
	$ /usr/sbin/rtcwake -u -d /dev/rtc0  -s20 --mode off
	[ ... ]
	$ # power on after 20 seconds

Changes since v1:
- drop abeoz9_reset_validity in abeoz9_rtc_set_alarm since we don't know
  for sure the time is set properly at that time.
- keep the RTC_FEATURE_ALARM change in a separate patch for easy
  backport

Liam Beguin (3):
  rtc: ab-eoz9: set regmap max_register
  rtc: ab-eoz9: add alarm support
  rtc: ab-eoz9: make use of RTC_FEATURE_ALARM

 drivers/rtc/rtc-ab-eoz9.c | 135 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 134 insertions(+), 1 deletion(-)

Range-diff against v1:
1:  7809a783807d < -:  ------------ rtc: ab-eoz9: make use of regmap local variable
2:  3b5d3fa74715 = 1:  d2c1ffa4007b rtc: ab-eoz9: set regmap max_register
3:  0a19ed90d4cc ! 2:  ac36be1f5f61 rtc: ab-eoz9: add alarm support
    @@ drivers/rtc/rtc-ab-eoz9.c: static int abeoz9_rtc_set_time(struct device *dev, st
     +	if (ret)
     +		return ret;
     +
    -+	ret = abeoz9_reset_validity(data->regmap);
    -+	if (ret)
    -+		return ret;
    -+
     +	return abeoz9_rtc_alarm_irq_enable(dev, alarm->enabled);
     +}
     +
4:  7004d40f2f36 = 3:  1987bef12ee8 rtc: ab-eoz9: make use of RTC_FEATURE_ALARM

base-commit: e49d033bddf5b565044e2abe4241353959bc9120
-- 
2.30.1.489.g328c10930387

