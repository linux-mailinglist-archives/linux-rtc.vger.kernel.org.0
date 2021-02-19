Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 990D631FEFB
	for <lists+linux-rtc@lfdr.de>; Fri, 19 Feb 2021 19:53:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229683AbhBSSv5 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 19 Feb 2021 13:51:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229587AbhBSSvz (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 19 Feb 2021 13:51:55 -0500
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com [IPv6:2607:f8b0:4864:20::832])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24B64C061574
        for <linux-rtc@vger.kernel.org>; Fri, 19 Feb 2021 10:51:15 -0800 (PST)
Received: by mail-qt1-x832.google.com with SMTP id v3so4668258qtw.4
        for <linux-rtc@vger.kernel.org>; Fri, 19 Feb 2021 10:51:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding:thread-index:content-language;
        bh=1jtIrblekXB73gz4KikpS9fWjU9kWZDwgLyZxGKnF5k=;
        b=TPbdB+jKq+ZyT8IfCWa+qDANejIV2MP1qvIT5aWiRUNpVhVxTfUHGVaBWBgs6yBrZV
         wDtqWFGfU/fvQB/UlGNeboJq1rJdMkmsIm/8wTZpKjLf9UgKkRvzdbfS9xIHSEZC83/F
         X0BYrbs3CSrqGCJTga9OV/145+snP57mK345kFFuP4U0nZ4qkqVkHeYWwB7+BRufUl0U
         FR3zCfTfqJAwZOMQG1q6Jz0CnyCPpIyeFwLTfAGDTq1SDeDDsvLAME1qGV9eom5OcsOQ
         aWOpjyjikxnXp71zxkFGEMFmrSad1LWguZ/c3REj2EVR6neECyhSTjDG2xhel14LaJjE
         T7rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding:thread-index:content-language;
        bh=1jtIrblekXB73gz4KikpS9fWjU9kWZDwgLyZxGKnF5k=;
        b=flZc3D+7echBG+sg1yswCCRphykbQ/kvaJDEc73dxynVCCxhK6N2Hle/2I0F3HTutO
         VRpgu2JUG2lgW8MapNixwUID0WanSbrZ0E+Xf1UdQ3zf4A2IufN080+LjDPeWPzxNK3b
         48zCcJDbBEIGDDt6kn/6WsEm4tDWy1t+O9aTFrX+IlwKtaaWITl+JX2tl7J7Nvy0WWzu
         t/VcEpWs8QmVHv9u4cyJYlTg4NR32kmJ+zXO4lMcZjnas7H3Se/o8wzEJL9KClxQDlTT
         nFyMhvT8FgMnovySMuQy1beH1dwKYuW3J1nfb+j8xcBd0y8D26jfsCAOjgvgn98ITZGB
         3tVg==
X-Gm-Message-State: AOAM532nb+SV+G0/zpwjyxFVV8+AuZ6ytAazdb3rIoWw+Cj1GeLlzUb5
        Vg3ebWR4VzdRGzE7nzBSAhk=
X-Google-Smtp-Source: ABdhPJxzmrYKvH0LzoXTQ+7LSURKcmqzDvWua3dHZ2WtGDVZ5zfhNOmOniSN0+PAreEEYNYlkD8qtg==
X-Received: by 2002:ac8:6693:: with SMTP id d19mr7981923qtp.185.1613760674350;
        Fri, 19 Feb 2021 10:51:14 -0800 (PST)
Received: from DESKTOPJC0RTV5 (pool-173-48-78-29.bstnma.fios.verizon.net. [173.48.78.29])
        by smtp.gmail.com with ESMTPSA id t24sm78652qtb.62.2021.02.19.10.51.13
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 19 Feb 2021 10:51:13 -0800 (PST)
From:   <charley.ashbringer@gmail.com>
To:     <a.zummo@towertech.it>, <alexandre.belloni@bootlin.com>
Cc:     <linux-rtc@vger.kernel.org>
Subject: [bug report] out-of-bound array access in drivers/rtc/lib.c rtc_month_days
Date:   Fri, 19 Feb 2021 13:51:12 -0500
Message-ID: <000801d706f0$31f2c370$95d84a50$@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AdcG7pw0/i+Yq1e2R/mmMfYAGOGyfw==
Content-Language: en-us
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi Alessandro and Alexandre,
Greetings, I'm a 2nd year PhD student who is interested in using UBSan to
the kernel.
Through some experiment, I found a out-of-bound array access in function
rtc_month_days.
More specifically, the through the call chain of 
davinci_rtc_set_time/davinci_rtc_set_alarm -> convert2days ->
rtc_month_days,
since davinci_rtc_set_time/davinci_rtc_set_alarm are ioctl functions,
thus the 2nd parameter, struct rtc_time *tm, is passed in purely from
user-space which can be any value.
And such a value, tm->tm_mon is used directly as an index to a fixed length
array, rtc_ydays.
This looks very fishy to me.

Although I know that, syzkaller has applied UBSan to this driver before, and
such a simple error cannot evade its detection, I'm still wondering if this
is a true error,
and more importantly, if it's not, then why, this will help me understand
linux a lot.

Looking forward to your valued response!

Best regards,
Changming Liu

