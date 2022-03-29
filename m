Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C3CEC4EB4C9
	for <lists+linux-rtc@lfdr.de>; Tue, 29 Mar 2022 22:43:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231495AbiC2Une (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 29 Mar 2022 16:43:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231802AbiC2Und (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 29 Mar 2022 16:43:33 -0400
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::223])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3F4AA997B
        for <linux-rtc@vger.kernel.org>; Tue, 29 Mar 2022 13:41:48 -0700 (PDT)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 4AEAC60003;
        Tue, 29 Mar 2022 20:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1648586507;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=BIraxn/PsxY3LCl6D++cDaOvkHcn080D46JZ8iFG7Xw=;
        b=h/24q65+tK/lChBRPfqke4ij1tVOtjix1vXpLy71ksKyhdTbt+oF6awO9wHN+mRub4OZ5V
        kSHD0S0qgUMhmHJ4RNikd7a1P/v7bBpfysS4puoaENpdWy8/84gAOVBqM0PLeiRsMG/H+Q
        6GfallPLJJp/gWanW1PM0qJ0ZNYcjdNPCdlehkpOKahEZ0fJN7n11O2NnmjcNgeJ5EmDUt
        bIbxnSGQzHZq6fAvy+mHGlqi7JWVwfOJCG9H1wkF1LnmQ/jn+k/JTM9fXE4AvMOmnSkg5j
        1Zd7opV8YVm63NlBtbtWLjLzEk0Gk1aRzcaN7Wx6FgFU4uXzhFQzy+29FLfH+g==
Date:   Tue, 29 Mar 2022 22:41:44 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     "Limonciello, Mario" <Mario.Limonciello@amd.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        "open list:REAL TIME CLOCK (RTC) SUBSYSTEM" 
        <linux-rtc@vger.kernel.org>, Jinke Fan <fanjinke@hygon.cn>,
        Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>,
        Raul E Rangel <rrangel@chromium.org>
Subject: Re: [PATCH] rtc: Fix the AltCentury for AMD platforms
Message-ID: <YkNvCH6NhJjoso88@piout.net>
References: <20220111225750.1699-1-mario.limonciello@amd.com>
 <dd1b3f97-316e-09ac-05de-43fb1320c5b0@amd.com>
 <YemwVn65H2yotmfd@piout.net>
 <DM4PR12MB5168A637030600A2B8B712D6E21E9@DM4PR12MB5168.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM4PR12MB5168A637030600A2B8B712D6E21E9@DM4PR12MB5168.namprd12.prod.outlook.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 29/03/2022 20:36:46+0000, Limonciello, Mario wrote:
> HI Alexandre,
> 
> I checked and didn't see this come into master as most of the 5.18 trees came in.
> Did this get forgotten?
> 

Not really, this was in my back log and actually the first one I wanted
to apply right now.

> Thanks,
> 
> > 
> > > Also if it wasn't made clear in my commit message or by analyzing this code
> > > change, I do believe that at least part of the reason for the previous
> > > regression was because of mucking with reserved bits.  This patch is much
> > > more conservative.
> > >
> > > In my testing I found similar behaviors from the old regression on a more
> > > modern platform when those bits were being touched.
> > >
> > > Mikhail,
> > >
> > > As you flagged the previous regression, would appreciate if you're able to
> > > test the new patch (although of course many things in your situation have
> > > changed now).
> > >
> > > Thanks.
> > >
> > 
> > --
> > Alexandre Belloni, co-owner and COO, Bootlin
> > Embedded Linux and Kernel engineering
> > https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fboot
> > lin.com%2F&amp;data=04%7C01%7Cmario.limonciello%40amd.com%7C3357
> > df64bb864b6ef63e08d9dc468eae%7C3dd8961fe4884e608e11a82d994e183d%
> > 7C0%7C0%7C637783018746468575%7CUnknown%7CTWFpbGZsb3d8eyJWIjoi
> > MC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C300
> > 0&amp;sdata=gvm24hJhVEsXrRQT6c1GtkMhi3q77Df1Biowb6gVdS8%3D&am
> > p;reserved=0

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
