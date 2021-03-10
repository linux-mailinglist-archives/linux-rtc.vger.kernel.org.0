Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0B9D333942
	for <lists+linux-rtc@lfdr.de>; Wed, 10 Mar 2021 10:54:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229609AbhCJJx7 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 10 Mar 2021 04:53:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230466AbhCJJxi (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 10 Mar 2021 04:53:38 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26179C06174A;
        Wed, 10 Mar 2021 01:53:38 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id i9so6703062wml.0;
        Wed, 10 Mar 2021 01:53:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=w0U5hMkEPQ0LdddaxPHYRwfwYDqIwqmZHfEAmO3vAk0=;
        b=SQmG6rWy2UTs1WF3luS2hAQ8gUh+sUo41HkJR3rjIVkAkhZSm2gOT771VWhgzFAcyn
         mNK5u43j8ljmeUbzzudDTuQ9s8YcQ89XfmMW+HoGq8/dMBxCKGmDnhk+l5dz1bt6tk1j
         mgPj4MnEWS5ET8JZQ2vH4f1Pc/sTjK6Wj9pEmp+6JJlKJa9kMeQek0fCDNIOypF9MSQl
         5y73dv3hysZ5X2rvKzg3BsRjdYttn3IocscTFLKuZPJ/1os/rnMix8pl1gDKZNbIY8Z5
         fwtbFlPgnMhl1DsMlFLSu63XrGkaepC6O/yVjLGuWbfH4uv4gOYx4LdPXFmi5jAeZwoG
         +uzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=w0U5hMkEPQ0LdddaxPHYRwfwYDqIwqmZHfEAmO3vAk0=;
        b=KNGxMzxLFEbzdSuJrz8eL+c96MyK+yKdemaHmGofxfEndR3JgKI56C/hu0F7iowFPd
         cH+R0nLiRcO7w6QgXLjRtA0uOmJ5mhUc5p61CpXxvpUCnQgehJPBKxR4MPkEROBLXM2u
         damM8rb40Qv5outRaWbhnzIc2GXZhsFolKS7C97u14ycz5cBlee/YAB0YAUXzeoeHmNE
         2aAb+jgvla0Wor5csO4GcuWQ7KKbYKWf045Nn27xLjRPCrInisne83gib1r2YOYIorJO
         MxNb2EZaoz6TvkyZaaj/aKt1hucj0ppsLAeySZqN6cEv6WciB16mg0Moufa7gb0jeBDq
         1bvA==
X-Gm-Message-State: AOAM531hDYh84Ze8SE/c0MiQJb6PWgPWfq6RDMlKmoIwsoXGXZPZAnqY
        9PY49KJ5fyKOmsBoQviAFOA1y7tMx70=
X-Google-Smtp-Source: ABdhPJypGyz5Hhbmt6VvpOmx/6LZfrs61H+giJS+ne1VO5WxE4zCe7/mJAKu/zOfWbMlnhjIttpLTA==
X-Received: by 2002:a1c:2b05:: with SMTP id r5mr2428301wmr.179.1615370016851;
        Wed, 10 Mar 2021 01:53:36 -0800 (PST)
Received: from Red ([2a01:cb1d:3d5:a100:264b:feff:fe03:2806])
        by smtp.googlemail.com with ESMTPSA id l4sm21933661wrt.60.2021.03.10.01.53.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Mar 2021 01:53:36 -0800 (PST)
Date:   Wed, 10 Mar 2021 10:53:34 +0100
From:   Corentin Labbe <clabbe.montjoie@gmail.com>
To:     a.zummo@towertech.it, alexandre.belloni@bootlin.com
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: rtc: rtc-m48t59: rtc-m48t59.0: IRQ index 0 not found
Message-ID: <YEiXHjIrXfjkrv5U@Red>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hello

On my SPARC sunblade 100, I got this:
[   13.613727] rtc-m48t59 rtc-m48t59.0: IRQ index 0 not found
[   13.805777] rtc-m48t59 rtc-m48t59.0: registered as rtc0
[   14.385092] rtc-m48t59 rtc-m48t59.0: setting system clock to 2021-03-01T05:34:33 UTC (1614576873)

The IRQ index 0 message is found after 5.5

Testing rtc via hwclock give:
hwclock: ioctl(3, RTC_UIE_ON, 0) to /dev/rtc0 failed: Input/output error
But this hwclock behavior is present also on earlier kernel (tested 4.9.260, 4.19.179 and 4.14.224).

Does this Input/output error is normal ? (I think no)

Regards
