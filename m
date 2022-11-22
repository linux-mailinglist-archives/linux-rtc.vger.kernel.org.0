Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C9CD9634AEE
	for <lists+linux-rtc@lfdr.de>; Wed, 23 Nov 2022 00:14:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235066AbiKVXOh (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 22 Nov 2022 18:14:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234886AbiKVXOe (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 22 Nov 2022 18:14:34 -0500
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06EF1C6541
        for <linux-rtc@vger.kernel.org>; Tue, 22 Nov 2022 15:14:32 -0800 (PST)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 176B2FF803;
        Tue, 22 Nov 2022 23:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1669158871;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=oY8Tf+PzNwdhBNyzNNE3Xnz0zDGUxa/EDy1tozRtt5c=;
        b=JY+yfzC9OAD6Z+d235ZYOL2aTfKDQQS0dTI4DCiCo/wxrvYcCspl1mwyVqqejuSX/KifxU
        0kpedJtGf/8vQVRkvccvvRttBRUtsp8edTJx4TtX8fTprjyOF7JC41xHFXVB/bJKqNktTf
        wkhtN5UumtRY2duG4F41YqNovNWDFRnJmQHxxM7iE2h+cO0dbHJ0J3t7f9WTyBjBdlCUwz
        1s/qzDpoF9wouV4ZHX+kakfCI4qiuRnKUhFoYNjxF9NfcNVqRqPpHmGRijwcIScQzGiekr
        6Gh+GY46un4a3T3DTDAKM9JCKeHbnFtd2ACxUo/YUAok/1MceY9FxD1Peki2vQ==
Date:   Wed, 23 Nov 2022 00:14:30 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Richard OGrady <Rich_Ogrady@grayhill.com>
Cc:     "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>
Subject: Re: Y2038 related bug in rtc subsystem for 32 bit processors
Message-ID: <Y31X1qOZBkUHfYE6@mail.local>
References: <BYAPR14MB307829F7F749AAD17473C10BF00D9@BYAPR14MB3078.namprd14.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BYAPR14MB307829F7F749AAD17473C10BF00D9@BYAPR14MB3078.namprd14.prod.outlook.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 22/11/2022 22:27:39+0000, Richard OGrady wrote:
> While testing Y2038 compatibility on a 32 bit arm processor I came across this potential bug?  in drivers/rtc/class.c (line 76 in v6.0.9)
> 
> 
>          tv64<https://elixir.bootlin.com/linux/latest/C/ident/tv64>.tv_sec<https://elixir.bootlin.com/linux/latest/C/ident/tv_sec> = rtc_tm_to_time64<https://elixir.bootlin.com/linux/latest/C/ident/rtc_tm_to_time64>(&tm<https://elixir.bootlin.com/linux/latest/C/ident/tm>);
> 
> 
> 
> #if BITS_PER_LONG<https://elixir.bootlin.com/linux/latest/C/ident/BITS_PER_LONG> == 32
> 
>          if (tv64<https://elixir.bootlin.com/linux/latest/C/ident/tv64>.tv_sec<https://elixir.bootlin.com/linux/latest/C/ident/tv_sec> > INT_MAX<https://elixir.bootlin.com/linux/latest/C/ident/INT_MAX>) {
> 
>                  err = -ERANGE<https://elixir.bootlin.com/linux/latest/C/ident/ERANGE>;
> 
>                  goto err_read;
> 
>          }
> 
> #endif
> 
> 
> 
>          err = do_settimeofday64<https://elixir.bootlin.com/linux/latest/C/ident/do_settimeofday64>(&tv64<https://elixir.bootlin.com/linux/latest/C/ident/tv64>);
> 
> 
> The #if/#endif block above causes the driver to not sync the system clock with the reading from the hwclock once the rtc reading reflects the Y2038 date and later.  I certainly could be wrong but it would seem that the block is over-protective and unnecessary.  We commented the block out and the system syncs fine with the rtc when the rtc is set to the year 2039.
> 

You are right and this is a workaround for an issue in systemd.
Honestly, the solution is to stop relying on rtc_hctosys and set the
system time from userspace.


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
