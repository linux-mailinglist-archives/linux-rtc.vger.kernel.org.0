Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9CC36570F14
	for <lists+linux-rtc@lfdr.de>; Tue, 12 Jul 2022 02:49:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229523AbiGLAtI (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 11 Jul 2022 20:49:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232033AbiGLAtD (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 11 Jul 2022 20:49:03 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BB9624088
        for <linux-rtc@vger.kernel.org>; Mon, 11 Jul 2022 17:49:01 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id l124so6146381pfl.8
        for <linux-rtc@vger.kernel.org>; Mon, 11 Jul 2022 17:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=OJ2VA643x+cLoyo+Y6jAv+v/zcVrcWntOu8VHnbUwkQ=;
        b=lMZcx76iNQHR0QwaO1CbKsJN52mKKnP4qKY+fe8sGi7mM2FtNvCreTmKGzLXYIAHIc
         6nt0IDEG71f0BJgxuiq5Rlt9fBWdJgHS4f0HyjHGWTsj32GobsF4Z2Rib0yTU5shTkEm
         9bSNjBaRRq/o1rAYyp/OXe+7rrFi33UhiT0JtNSjW+wH9RQEMwa2B2H1lztTmw2rvV+z
         Bx6stfbm6/tkDzr0PqyWIpis02zUM425xjpzfHdQlR+nrAVG8wE7CND0a+u4eNGCFEfq
         N+mEJyr1K9e8+KzrwVVG7Ho5fzWcLt3/0/whq3fWP5dT9WTe88ZRj3AoXPi7q2CCSsEb
         lqjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=OJ2VA643x+cLoyo+Y6jAv+v/zcVrcWntOu8VHnbUwkQ=;
        b=mjhQzHK+YfQK2ovT2HELoCatouD/lcvlkZmuBQoYMjFB//0Mx6RSKPX3gk0D/yncPV
         SnGM2Rw8vlLZHvYYDyLY2uMS2NEkpkJ1xXsoSfbYTK7WFggwJY+ATbNzBDtywJOdsxid
         hz/zjNBHUQsNf8usGP01lXPy5WZQDODl/zcjxFUdT/SugMCs6NScu8yyY6+QGii7fNkw
         TJxt1w5qEU74S0cym83zQYbPYychsaLCFKAo7IzPiIhAtCT8y/V3cs+kzmrfHsIRHfXO
         lOPWCekPBGSafL3Q5RoW/ORkgUg7PNErcDz0X9I7h8vVusRYFJZWNd/AcM47WRblgahq
         SpMA==
X-Gm-Message-State: AJIora+WFQzyMPNozkcKf5maRajlUjLzcRCmZ+qKpg8ujQY+c7MfX7Dk
        kM4HNNZaaPrD8XaPc/o99dkBmLnpvjkXtNfgQ91sEF0I5cOSMA==
X-Google-Smtp-Source: AGRyM1vpSi7m6GLbeWpvpAcRNAy8hSlFkbYs8acBZ3yu8pfXquPp1gqQ6MPbgXxpBsJ4JnhzWYfi7eZ5/SAVES3ygJs=
X-Received: by 2002:aa7:8d54:0:b0:52a:c718:ff1 with SMTP id
 s20-20020aa78d54000000b0052ac7180ff1mr10822085pfe.29.1657586940386; Mon, 11
 Jul 2022 17:49:00 -0700 (PDT)
MIME-Version: 1.0
From:   Kevin Rowland <kevin.p.rowland@gmail.com>
Date:   Mon, 11 Jul 2022 17:48:49 -0700
Message-ID: <CAHK3GzwVbWBi8OYOmdnDq7nOxwp45qpSFU4UT+wK0=UVUNyQsw@mail.gmail.com>
Subject: rtc: userspace alarmtimer via posix-timers or timerfd
To:     linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hello,

I'm curious if there's some mechanism in the kernel to bridge POSIX
timers (or the timerfd subsystem) and the alarmtimer feature.

The intent is to give userspace the ability to set timers that
(optionally) result in the system waking from suspend via RTC alarm.

I was thinking about hacking together something myself in
`kernel/time/posix-timers.c`, but then found `alarmtimer.c` which, as
far as I can tell, is exposed only to the rest of the kernel.

Any pointers welcome.

Best,
Kevin
