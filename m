Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B6EA1692C7B
	for <lists+linux-rtc@lfdr.de>; Sat, 11 Feb 2023 02:18:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229871AbjBKBSi (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 10 Feb 2023 20:18:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229698AbjBKBSh (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 10 Feb 2023 20:18:37 -0500
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34FD1765E2
        for <linux-rtc@vger.kernel.org>; Fri, 10 Feb 2023 17:18:36 -0800 (PST)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-52ebee9a848so75435567b3.3
        for <linux-rtc@vger.kernel.org>; Fri, 10 Feb 2023 17:18:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cp2zIBbIpvXAM7Zj4Wg0jFyWUO1R0STE0dCNXKFyBY4=;
        b=AELaoNaTADorAiw+/Zz9py1vM8XiJQuku5iNqK6EosG6jV2SGVk0PQPEyYLgtzjy63
         Kiv1zMwLkvvwExoFz3QfYzCTCfNQr3XB2G5E4tsDfCyFh8Todn0lZs+ZKACVgC6Uqo4E
         2vapFN3R9BgKr2ekNd99ryKlPqvy+lMNo7kQ8TsyLXDNX21suN/FRH7Vlq1EU9HdliDV
         CwM/vZS2W0bJgackJ6I6VILwPPXUWmek4YonUmROzRLojSpMCvwodLRVs8yOX1a1fT/r
         2BvNW+VMIWRUzipzsh53iLe+fIXZFgCTlo2YBtMVHHUxCINVjxVf4mdbOc4pn8TaNn8g
         kuZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cp2zIBbIpvXAM7Zj4Wg0jFyWUO1R0STE0dCNXKFyBY4=;
        b=ftRqCJyYe3JUaek2e4l8AwjrpiO9B3U/T/PaG8BiDucO9ZGoWI75wuOy+y7Cs9r6wS
         nl5KszwJvObYILy+RoiAUqoG0sfmVfzFbg86jAE+wd8PodVfmOzcTpypYRn+GAbsp944
         3O+TL/G8LENRELZf9chH89eKWvXur8gk9FGvCuKScIztRLiSoR7/TYS0CXDoi9NAgYQ4
         wuUqsvqARDUQjl1z5KzRf3vsYImkAOSpaMDdjReuATshbPNcqeLV2I1QZYaCDPUyAHuF
         XwTBoyMLe8Mx71X94YjA5ChLrKdKuWT84uFy86vbsIC/eanIoXVEuaUqyWp+wYYiPd/K
         4DJQ==
X-Gm-Message-State: AO0yUKX5mJ+hXV+sVf8G2y26VHqcM5ja4ybBoPBfisZFl3xssQPZRPpL
        H1S4IN3uvNnOu1MKqPHp843yOn/sM5x272DH8fMJ
X-Google-Smtp-Source: AK7set+N85BqMue2v5DA9Vr88JsCXNggIFu/8mvX8mUPoZrr6/LcRki42XTM/2uOd37lvUPRUKmH16fMgwdWvO+OcmQ=
X-Received: by 2002:a0d:cb04:0:b0:52b:e174:c153 with SMTP id
 n4-20020a0dcb04000000b0052be174c153mr1426017ywd.271.1676078315356; Fri, 10
 Feb 2023 17:18:35 -0800 (PST)
MIME-Version: 1.0
References: <S1728511AbfHaSEm/20190831180442Z+580@vger.kernel.org>
 <08fbdf25-faa1-aa13-4f13-d30acbf27dda@mipisi.de> <20190902074917.GA21922@piout.net>
 <alpine.DEB.2.21.1909021247250.3955@nanos.tec.linutronix.de>
 <4fc3a016-ec2f-a15e-5fd1-6794a001e2d9@mipisi.de> <alpine.DEB.2.21.1909040047210.1902@nanos.tec.linutronix.de>
 <Y+O+VBSNywC7LKhn@panicking> <87edr02fsc.ffs@tglx> <CAOf5uwn1SKBR+pREZy9f-wnQf6Lw3epyHxiX_hjf_pOaiiSDWA@mail.gmail.com>
 <87zg9m26f2.ffs@tglx> <CANDhNCopf___L_3cARqK8WDHSJWFYYikxvANHh2CRMjDRag9yw@mail.gmail.com>
In-Reply-To: <CANDhNCopf___L_3cARqK8WDHSJWFYYikxvANHh2CRMjDRag9yw@mail.gmail.com>
From:   John Stultz <jstultz@google.com>
Date:   Fri, 10 Feb 2023 17:18:23 -0800
Message-ID: <CANDhNCqaawcr6hxxKsk1Vd8e4kvwd8-qgVv--uLtWnB1AoJdig@mail.gmail.com>
Subject: Re: Problem when function alarmtimer_suspend returns 0 if time delta
 is zero
To:     Thomas Gleixner <tglx@linutronix.de>
Cc:     Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
        Michael <michael@mipisi.de>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Fri, Feb 10, 2023 at 5:04 PM John Stultz <jstultz@google.com> wrote:
> Thomas' patch fixes the erronious 0-as-invalid initialization issue
> using KTIME_MAX but also simplifies the logic getting rid of the
> freezer handling.
>
> I don't have as much familiarity with the freezer handling change, so
> while it looks sane, I can't say I would likely catch an issue doing a
> visual review.

Actually, because of this, I'm going to split Thomas' change in two.

The first to just use KTIME_MAX as the invalid initialization value,
and the second to cleanup the freezer logic.

That way if the freezer change is problematic we can revert it and not
lose the fix here.

thanks
-john
