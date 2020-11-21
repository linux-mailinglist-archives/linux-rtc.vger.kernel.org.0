Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83BC92BBE4C
	for <lists+linux-rtc@lfdr.de>; Sat, 21 Nov 2020 10:53:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727433AbgKUJvt (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 21 Nov 2020 04:51:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727385AbgKUJvs (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 21 Nov 2020 04:51:48 -0500
Received: from sipsolutions.net (s3.sipsolutions.net [IPv6:2a01:4f8:191:4433::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB058C0613CF
        for <linux-rtc@vger.kernel.org>; Sat, 21 Nov 2020 01:51:47 -0800 (PST)
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
        (Exim 4.94)
        (envelope-from <johannes@sipsolutions.net>)
        id 1kgPYW-00BuHJ-DW; Sat, 21 Nov 2020 10:51:44 +0100
Message-ID: <229d3b5d615c858345a8b84454099eefd64581ce.camel@sipsolutions.net>
Subject: Re: [PATCH] rtc: enable RTC framework on ARCH=um
From:   Johannes Berg <johannes@sipsolutions.net>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
        linux-um@lists.infradead.org
Date:   Sat, 21 Nov 2020 10:51:43 +0100
In-Reply-To: <20201120223914.GD348979@piout.net>
References: <20201120211103.6895ac740d11.Ic19a9926e8e4c70c03329e55f9e5b1d45095b904@changeid>
         <20201120223914.GD348979@piout.net>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-malware-bazaar: not-scanned
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Fri, 2020-11-20 at 23:39 +0100, Alexandre Belloni wrote:
> On 20/11/2020 21:11:06+0100, Johannes Berg wrote:
> > From: Johannes Berg <johannes.berg@intel.com>
> > 
> > There's no real reason it should be disabled, and at least we can
> > use it for development & testing with the RTC test driver.
> > 
> > However, two devices are missing a HAS_IOMEM dependency, so add
> > that to avoid build failures from e.g. allyesconfig.
> > 
> > Signed-off-by: Johannes Berg <johannes.berg@intel.com>
> Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> 
> > ---
> > Would there be objection to taking this through the linux-um tree?
> > I have a couple of patches that depend on it as well, to add
> > suspend/resume support with a pseudo-RTC to wake up from it.
> 
> I'm fine with that.

Thanks. I think I spoke too quickly here though; I realize now that it's
probably better if you just merge it through whatever RTC tree you have.

Some of the code I was working on has "depends on RTC_CLASS", but then
it obviously doesn't matter what tree it goes through, it doesn't have
any conflicts, and things will just fall into place whenever all patches
are merged, regardless through which tree.

For my local experimentation etc. it doesn't matter, I can just carry
this.

I apologize for not thinking this through properly yesterday, but now
think it's better if it just goes through the normal route.

Thanks,
johannes

