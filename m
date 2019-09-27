Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1B19BC03CF
	for <lists+linux-rtc@lfdr.de>; Fri, 27 Sep 2019 13:04:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725882AbfI0LEv (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 27 Sep 2019 07:04:51 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:33440 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726809AbfI0LEv (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 27 Sep 2019 07:04:51 -0400
Received: by mail-wr1-f65.google.com with SMTP id b9so2269790wrs.0
        for <linux-rtc@vger.kernel.org>; Fri, 27 Sep 2019 04:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=9ciKUllz8cRvciY2ix6rQnwrk8CF26+Aq3v7PMw8/fc=;
        b=ir885x5GJOVfSktjxh6gFJ9iBvr7R1ZUwYMpR6excNT+0hzyuLO50CEXmYrBZngyyY
         rDFmLktMsM2h6cBYyHiLMZEcOl7umafGtZpDjtuqYIssuqJRKXVjObOmflLL73k0FEE1
         BRkgwBX2eWpcPIow4jcLkzY5nuIfKvWqQEIjFVFykJ6lSQDO07s+HZkW2Flbyu6Ssz+G
         TawL8S7LrgNu7tVoFwQl2yADKIZJP/7sN7uXKnJk6BJda9Zqi6s9ReszCxqw/6s8k06w
         I3HcTCdKO8QpBgOk/2k9g22TPlrq2GU/dl6zUKm2Ubne8p+c+mKrnGsPoJpmKSaOoZ23
         YTKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=9ciKUllz8cRvciY2ix6rQnwrk8CF26+Aq3v7PMw8/fc=;
        b=iZQZUcr1BdM04hDaew1tYIBKt3nlxa165lHgD3Hjnsa6EwnLBM3F1BryIz5gp96+G8
         2ZNbrZ8jCegB+gVnytvqLVDlfGMeiSAB8UXgEL3PjcMLxY4/jqb3WlDOkHH7eF5wcOeF
         wgPufLOxsXFWvg2Tfg5wsiIczLCgAzVYMupeIwq3SjXa0/EmLvYz1igxrhQAhL/+a6K5
         +jOhwp/rxYHhiCsbr4XCYRfYK2jyN6T9b7xJY3YmXUJKvuO8gb9rlAyCR6fkrTZyMV27
         aaQ8Hdmg6IsTFR+431/wqG+nRkhkXyWSzlUBBSlMDgdYOgZECFNpoJzPcJXMED0yTXYA
         Y2Aw==
X-Gm-Message-State: APjAAAWKwRYJ1aDiadaUzfNTiwjZOKfwGG7chtzdZqBOW+qsJlTYgu3H
        zTTQjIyKbKtzQYff7i6wH75Ib4mzwBg=
X-Google-Smtp-Source: APXvYqxE9JowBA73dwKob1+hQUqcyLnYGK6sJRPLEkwuMaQayboSKLGvGWjMGOSo+oanhRdvezfm+Q==
X-Received: by 2002:adf:ef8d:: with SMTP id d13mr2532352wro.31.1569582289165;
        Fri, 27 Sep 2019 04:04:49 -0700 (PDT)
Received: from gmail.com (171.42.137.88.rev.sfr.net. [88.137.42.171])
        by smtp.gmail.com with ESMTPSA id o188sm9234925wma.14.2019.09.27.04.04.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Sep 2019 04:04:48 -0700 (PDT)
Date:   Fri, 27 Sep 2019 13:04:46 +0200
From:   Emmanuel Nicolet <emmanuel.nicolet@gmail.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org
Subject: [PATCH] rtc: use timeu64_t for range_max
Message-ID: <20190927110446.GA6289@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi,
for rtc drivers where rtc->range_max is set U64_MAX, like the PS3 rtc,
rtc_valid_range() always returns -ERANGE. This is because the local
variable range_max has type time64_t, so the test
	if (time < range_min || time > range_max)
		return -ERANGE;
becomes (time < range_min || time > -1), which always evaluates to true.
timeu64_t should be used, since it's the type of rtc->range_max.

Signed-off-by: Emmanuel Nicolet <emmanuel.nicolet@gmail.com>
---
 drivers/rtc/interface.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/interface.c b/drivers/rtc/interface.c
index c93ef33b01d3..eea700723976 100644
--- a/drivers/rtc/interface.c
+++ b/drivers/rtc/interface.c
@@ -70,7 +70,7 @@ static int rtc_valid_range(struct rtc_device *rtc, struct rtc_time *tm)
 		time64_t time = rtc_tm_to_time64(tm);
 		time64_t range_min = rtc->set_start_time ? rtc->start_secs :
 			rtc->range_min;
-		time64_t range_max = rtc->set_start_time ?
+		timeu64_t range_max = rtc->set_start_time ?
 			(rtc->start_secs + rtc->range_max - rtc->range_min) :
 			rtc->range_max;
 
-- 
2.23.0

