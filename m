Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1BEA30289D
	for <lists+linux-rtc@lfdr.de>; Mon, 25 Jan 2021 18:20:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728142AbhAYRSx (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 25 Jan 2021 12:18:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730971AbhAYRSX (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 25 Jan 2021 12:18:23 -0500
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACA23C06174A
        for <linux-rtc@vger.kernel.org>; Mon, 25 Jan 2021 09:17:41 -0800 (PST)
Received: by mail-ed1-x52f.google.com with SMTP id s11so16361060edd.5
        for <linux-rtc@vger.kernel.org>; Mon, 25 Jan 2021 09:17:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=message-id:subject:from:reply-to:to:cc:date:user-agent:mime-version
         :content-transfer-encoding;
        bh=bUEsU/tprOVOj4qeu2Xm+T71DausddLsUqqHXK3hWN4=;
        b=cggjEbJr6ejE9b8SRZyytPCL5lyeXNZ258F6Q6rd/2BhtciTrk7FUdhju4zwXc37si
         pwckkXgnvMeAGa46J+tNVlbOb2a5JSBd9aeouwk7tLnBQt8mbDgcIQuyrxGOMna6/A1D
         XBIKsxJjnS3SXhUHO7878PEmA2rHMekYOhBolLImyF3Z0/Z/K57NRX4zMCmL/eWnDfLU
         KVQXqdIa9vukhSF88EAQYst0qpUGE3VJ30rSrhqYBJWRUxWSoWMHhf3a0v0MqcPHXCIo
         KlJ0O3TMtS8NEIqhi3L5E3eyyhKCvdx+O/wlokv5zqy3WboWVu5nnd0PUljERHvRACWz
         aUrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:reply-to:to:cc:date
         :user-agent:mime-version:content-transfer-encoding;
        bh=bUEsU/tprOVOj4qeu2Xm+T71DausddLsUqqHXK3hWN4=;
        b=nPH+x+fVlmflD4EaMcwc6LMiTAH0RZk2BqZ9F/xzVDnmr0ptaHwMOOMzeMjnOdwsmm
         rrVfI55NWPQwhxo5w8q5J5IXkw4yrgfnAUEAFK8ZbZIvfWWkUeJko2B5Jg1W4YXxMQEg
         5yeG3SZG0frSr+YdBalYg+EE0QvUAFNaPb4VZSGnF+tx8AUOtckHu3ymQppGOGalz/bl
         wd2qdH8IZE2BYmQXRL6CNuPwBt3d+WKDSqffcvjNXevou3K/c5PDX59t0weIQ3pyRQr3
         hDJbWo73j226HEjML+t2N9CpIyzAbvFfr2HnOZq4a2JbWSwp+/kRNarffMGFyE0wWXWj
         h8aw==
X-Gm-Message-State: AOAM5337742XLQflY6S38GODxMsZ7CexxvdZn4FykEuGZpLe2KzayGta
        tEwcC8FzSebg34Vt+VVpkqP+CSiYMFjzLQ==
X-Google-Smtp-Source: ABdhPJwAoCqZtvK3TQJtYquBvwH0y+vfAYVr/PGbutIQLskr4IdGx9BRyHRT0Wza5fdj4vTEnAS/aQ==
X-Received: by 2002:a05:6402:614:: with SMTP id n20mr1330993edv.358.1611595060473;
        Mon, 25 Jan 2021 09:17:40 -0800 (PST)
Received: from mars.fritz.box ([2a02:8070:b9d:f200:6139:400d:8db4:21a5])
        by smtp.gmail.com with ESMTPSA id g14sm10954942edm.31.2021.01.25.09.17.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jan 2021 09:17:39 -0800 (PST)
Message-ID: <9a4ff4654151823316f565adf9d651ccd39806a0.camel@googlemail.com>
Subject: [RFC][PATCH] rtc: proc/sysfs: read actual alarm time from hardware
From:   Christoph Fritz <chf.fritz@googlemail.com>
Reply-To: chf.fritz@googlemail.com
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org
Date:   Mon, 25 Jan 2021 18:17:38 +0100
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Show actual alarm time from hardware by using __rtc_read_alarm()
instead of rtc_read_alarm() because some hardware does not support
secounds and is therefore rounding up actually.

Test, set an alarm in 20 secounds:
    w="/sys/class/rtc/rtc0/wakealarm"; now=$(date +%s); \
    t=20; alarm=$(expr $now + $t); \
    echo 0 > $w; echo $alarm > $w; \
    echo $now; cat $w; \
    echo -n "off by: "; expr $(cat $w) - $now - 20

Test result without this patch applied:
    1579972610
    1579972630
    off by: 0

Test result with applied patch:
    1579972543
    1579972620
    off by: 57
---
My question here is: Should /proc/driver/rtc and
/sys/class/rtc/rtc0/wakealarm show the actual alarm time from hardware
or the alarm time set by the user? There may be other implications?
---
 drivers/rtc/proc.c  | 2 +-
 drivers/rtc/sysfs.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/proc.c b/drivers/rtc/proc.c
index 73344598fc1b..79f7969f9867 100644
--- a/drivers/rtc/proc.c
+++ b/drivers/rtc/proc.c
@@ -52,7 +52,7 @@ static int rtc_proc_show(struct seq_file *seq, void *offset)
 			   &tm, &tm);
 	}
 
-	err = rtc_read_alarm(rtc, &alrm);
+	err = __rtc_read_alarm(rtc, &alrm);
 	if (err == 0) {
 		seq_printf(seq, "alrm_time\t: %ptRt\n", &alrm.time);
 		seq_printf(seq, "alrm_date\t: %ptRd\n", &alrm.time);
diff --git a/drivers/rtc/sysfs.c b/drivers/rtc/sysfs.c
index 8a957d31a1a4..bb49c3544c2c 100644
--- a/drivers/rtc/sysfs.c
+++ b/drivers/rtc/sysfs.c
@@ -138,7 +138,7 @@ wakealarm_show(struct device *dev, struct device_attribute *attr, char *buf)
 	 * exact YYYY-MM-DD HH:MM[:SS] date *must* disable their RTC
 	 * alarms after they trigger, to ensure one-shot semantics.
 	 */
-	retval = rtc_read_alarm(to_rtc_device(dev), &alm);
+	retval = __rtc_read_alarm(to_rtc_device(dev), &alm);
 	if (retval == 0 && alm.enabled) {
 		alarm = rtc_tm_to_time64(&alm.time);
 		retval = sprintf(buf, "%lld\n", alarm);
-- 
2.29.2


