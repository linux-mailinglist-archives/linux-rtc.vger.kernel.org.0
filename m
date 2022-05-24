Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E70D5333D7
	for <lists+linux-rtc@lfdr.de>; Wed, 25 May 2022 01:19:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233046AbiEXXTq (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 24 May 2022 19:19:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242546AbiEXXTq (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 24 May 2022 19:19:46 -0400
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 635677983F
        for <linux-rtc@vger.kernel.org>; Tue, 24 May 2022 16:19:44 -0700 (PDT)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id C4D3F240004;
        Tue, 24 May 2022 23:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1653434383;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=n3/jS9ZhNjFNjIx53A0srMNJvD8FaB5Npx07Q8FdRzw=;
        b=To4vWN/vBJ1oMB7FVcdLFKExdF2So5m236HVHW9IF0AS7ShOgXigYzu6VHbBll4GX7ZgDH
        WSOxG8xscCqqvVLn5bjKU3AslUoprUMc+Yo5AscDbVjiDmsozhO8gKe16i4E7e31ISoxlo
        8BDVR5ymcZDaSr3OVoa+cfmdLMaSZ/qIWz11ELsCOylYBh2BOaiu7NKDfsKcC0/j0p/+rH
        CNuzELWPwApp0qhfvhTejUaSJYR/A21tFHBnOosXrM40kCwabxNqOW7kcNQ2tqDUf6wMAW
        qPoAEpy9rS1diaX0lQjihlSfVFmJEwhsV4NE7y+wvzcyPOeJqi9wo53Qt36Z1g==
Date:   Wed, 25 May 2022 01:19:42 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Alessandro Zummo <a.zummo@towertech.it>, linux-rtc@vger.kernel.org,
        Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     Colin Ian King <colin.i.king@gmail.com>, Tom Rix <trix@redhat.com>
Subject: Re: [PATCH v2] rtc: rzn1: Avoid mixing variables
Message-ID: <165343435694.80475.17407920771959076356.b4-ty@bootlin.com>
References: <20220520082221.488849-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220520082221.488849-1-miquel.raynal@bootlin.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Fri, 20 May 2022 10:22:21 +0200, Miquel Raynal wrote:
> In the ->set_offset() callback, the 'val' variable is used for two
> different purposes at the same time, which is oviously wrong:
> - It contains the intermediate value of the SUBU register that must be
>   written at the end of ->set_offset().
> - It is used in the middle of the above calculations to poll the CTL2
>   register for a specific value.
> 
> [...]

Applied, thanks!

[1/1] rtc: rzn1: Avoid mixing variables
      commit: 64d69b5daf6fe9b86236d34e57ba8ebf7d84f245

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
