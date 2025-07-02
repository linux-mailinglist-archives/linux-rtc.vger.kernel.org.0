Return-Path: <linux-rtc+bounces-4408-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6660AAF5BB2
	for <lists+linux-rtc@lfdr.de>; Wed,  2 Jul 2025 16:52:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 620454A1FBB
	for <lists+linux-rtc@lfdr.de>; Wed,  2 Jul 2025 14:51:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E31530AAD1;
	Wed,  2 Jul 2025 14:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tyhicks.com header.i=@tyhicks.com header.b="TaK1NUrp";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ZVc+l++F"
X-Original-To: linux-rtc@vger.kernel.org
Received: from fhigh-a8-smtp.messagingengine.com (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E914A3093D8;
	Wed,  2 Jul 2025 14:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751467928; cv=none; b=QGGZlRH/2ET0SahHQr9ZkGpOOghNAPsu09+qIXxAOIBireeiX+ayPdc8/B4Kji8WvVvQ1dEhIBZz2kl3tEM+5n8+6a7AwLlwjsZFkoCCFggB4+5clwwdBai41lOalOd/w7CO7tUFU4fxxFVA21iS7R+2XlSWQqS4gFPho/Z+eLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751467928; c=relaxed/simple;
	bh=c5YO8Q6fqo9a7i/BZ1Pu+lEXRY2gSYoqGCcNPYTg9lw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MPVpcNTahtrdtSgnt8rgFgoJ87QCWifnBbGO+eP8D5G4Z/nTACxcP7Z3S9kU2+uLKWDzsXaZJ1EPp+0FYgtDUl1xbtwanmzhSQ4q8ePDed9q8ZR36V/1B28WrVr0pll4gERaJMSK3S0/bJ2F6Ageax+tbjNEp/azvgq+L9aaJY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tyhicks.com; spf=pass smtp.mailfrom=tyhicks.com; dkim=pass (2048-bit key) header.d=tyhicks.com header.i=@tyhicks.com header.b=TaK1NUrp; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ZVc+l++F; arc=none smtp.client-ip=103.168.172.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tyhicks.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tyhicks.com
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfhigh.phl.internal (Postfix) with ESMTP id F36DF14001FC;
	Wed,  2 Jul 2025 10:52:04 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Wed, 02 Jul 2025 10:52:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tyhicks.com; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1751467924; x=1751554324; bh=A8fMjHitcx
	dIM6PCP7N5H3M8CWgWa7BSB4FNRbpMw6c=; b=TaK1NUrpLAZp1N1/2KrKW28fdq
	UpXwEf0JAz1tGoiJWiqJoRmGkQbONKQ2Cs7XyOuyFpaUFknwIEq6/1kHqP6dPYhD
	FZ7EDGJQENgQwrOPxOnaCHYUD/zxi/BoBsht+vgCUjRIK9iUCfmM/RjV20AB9l5V
	Mw6QqCUqFv8s+MUCRah+SCXqggiyrREOUhId/i3eJNPUkbTonXDZIHLLgp3bOxXs
	0u7JtgfkNMRJxhV6yvzP8Q7WIl9ksP0o5FJBFqfsA2WsuoWy4XXv+W+Mr0t0hdAg
	RVfWG4BABiUXcZbaWGowpGiiXvCpJgv6ZgG2RNWyz+R2QN1xyOhUyaJQGbcQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1751467924; x=1751554324; bh=A8fMjHitcxdIM6PCP7N5H3M8CWgWa7BSB4F
	NRbpMw6c=; b=ZVc+l++FsRlxPFsB05YzzBVvPDBwEHP/Nr8I1Z8hr9eYGBGK3et
	ev9zSc+NFTYaE8nbq2bP/Lb9ZRsXyi2c8xwH2Z4gXVsASp2L35Ow3bShqmOeEHTm
	wbMibR/tXZ6xiSLumtxmlgHs6oqYSPIKeo+MI/rE8ej9RrN+Ww90p/JFvt2okclC
	Xd/Vt2/iDSZ6mxNSSX8vqyLf0bPPmrnvmUM0Z18LjW6zwudrb6LnngCDcYnEUTfv
	/zu2sYjpHMcbg50Xq7Kfoi1XarDSXoE9be5q8x5198PIojee2/hfLm7a/LH7w8IJ
	JlOG5w4GT6/uzpe8AG+bzjU/VJxP6neSkPQ==
X-ME-Sender: <xms:lEdlaNDqHWNgyO9P5Ue-dLFo_T6nqCYG3znMkSLGueNfA9h4YOJ1Hw>
    <xme:lEdlaLj2aTTxS7US4j-F7FZxDI2C5ZuyGUBN4GsMxZc6oCgg4yCfSwOxMKO4idXKZ
    _i2TwLkrJu4bXYXdJI>
X-ME-Received: <xmr:lEdlaIm0x31A6m3_ofzZMGu5zFhgaSagO3wkqa4LglRNpbyG0NdNl5DRkw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddujeeikecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefvhihlvghrucfj
    ihgtkhhsuceotghouggvsehthihhihgtkhhsrdgtohhmqeenucggtffrrghtthgvrhhnpe
    dvhedvtddthfefhfdtgfelheefgefgudejueevkeduveekvdegjedttdefgfelieenucev
    lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegtohguvgesth
    ihhhhitghkshdrtghomhdpnhgspghrtghpthhtohephedpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtohepghhiohhmvghtthhisegvnhhnvggvnhhnvgdrtghomhdprhgtphhtth
    hopegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmpdhrtghp
    thhtohepmhgvrghgrghnlhhlohihugeslhhinhhugidrmhhitghrohhsohhfthdrtghomh
    dprhgtphhtthhopehlihhnuhigqdhrthgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhr
    tghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:lEdlaHxganuAlhHrYQPz6jIOukMXcMTk-04yD8teA6AdX7oq0CoCBA>
    <xmx:lEdlaCRBjtUe9r2jjKgfcRoajC7Q35veAIENJ6atl7_xxaxv4pevaQ>
    <xmx:lEdlaKawLoI77_Cowd_lY4kM1Xfst2souQAb59EzOavSivApIEyYBg>
    <xmx:lEdlaDTsO6CEnILRLqNiG7-SgqotdY8wfTDc1C-S2BQRTX0PZkd-xQ>
    <xmx:lEdlaNwQivqErY9gVSKQXDEDiOzTGUyTbBL9FlGNkzbGfdzdnSBpwtR5>
Feedback-ID: i78e14604:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 2 Jul 2025 10:52:04 -0400 (EDT)
Date: Wed, 2 Jul 2025 09:52:02 -0500
From: Tyler Hicks <code@tyhicks.com>
To: Rodolfo Giometti <giometti@enneenne.com>, alexandre.belloni@bootlin.com
Cc: Meagan Lloyd <meaganlloyd@linux.microsoft.com>,
	linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Expand oscillator stop flag (OSF) validity check to
 ds1341
Message-ID: <aGVHkgDaWN83X9hA@redbud>
References: <1749665656-30108-1-git-send-email-meaganlloyd@linux.microsoft.com>
 <aGMVtfwB5gmBuW4T@redbud>
 <91ea3b14-20c5-4e5b-a88a-206748a6d36c@enneenne.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <91ea3b14-20c5-4e5b-a88a-206748a6d36c@enneenne.com>

On 2025-07-02 16:37:41, Rodolfo Giometti wrote:
> On 01/07/25 00:54, Tyler Hicks wrote:
> > [Adding Rodolfo Giometti]
> > 
> > On 2025-06-11 11:14:14, Meagan Lloyd wrote:
> > > We would like to use CONFIG_RTC_HCTOSYS to sync a supercapacitor-backed
> > > DS1342 RTC to the kernel time early in boot. An obstacle is that the
> > > sync in rtc_hctosys() is unconditional as long as rtc_read_time()
> > > succeeds and in some power loss situations, our RTC comes up with either
> > > an unpredictable future time or the default 01/01/00 from the datasheet.
> > > Syncing a future time, followed by an NTP sync would not be desired as
> > > it would result in a backwards time jump. The sync feature is useful in
> > > boot scenarios where power is maintained so syncing only when the RTC
> > > data is valid would allow us to make use of the feature.
> > > 
> > > The DS1342 has the oscillator stop flag (OSF) which is a status flag
> > > indicating that the oscillator stopped for a period of time. It can be
> > > set due to power loss. Some chip types in the ds1307 driver already use
> > > the OSF to determine whether .read_time should provide valid data or
> > > return -EINVAL. This patch series expands that handling to the ds1341
> > > chip type (DS1341 and DS1342 share a datasheet).
> > > 
> > > These changes enable us to make use of CONFIG_RTC_HCTOSYS as they
> > > prevent the invalid time from getting synced to the kernel time. It will
> > > also prevent userspace programs from getting the invalid time as the fix
> > > cuts it off at the source - the .read_time function.
> > 
> > These two patches look good to me, although I'm not an expert in RTC drivers.
> > I've reviewed the DS1341/DS1342 datasheet and the approach that Meagan has
> > taken makes sense to me given our (Meagan and I work together) desire to use
> > CONFIG_RTC_HCTOSYS and the need to avoid syncing from an invalid RTC state.
> > 
> > I've added Rodolfo because he first added the logic to clear the Oscillator
> > Stop Flag, during driver initialization, way back in 2007 with v2.6.23 commit
> > be5f59f4b67f ("rtc-ds1307: oscillator restart for ds13{37,38,39,40}") and may
> > have additional context to provide.
> > 
> > Alexandre and Rodolfo, does this approach make sense to you? If not, do you
> > have any other suggestions on how to make CONFIG_RTC_HCTOSYS work with this
> > driver? Thanks!
> 
> They look good to me. You can add my Acked-by line to all of them:
> 
>     Acked-by: Rodolfo Giometti <giometti@enneenne.com>

Thanks for taking a look!

I should have formally given my Reviewed-by tag for both patches earlier in the thread:

  Reviewed-by: Tyler Hicks <code@tyhicks.com>

Tyler

> 
> Rodolfo
> 
> > Tyler
> > 
> > > 
> > > Meagan Lloyd (2):
> > >    rtc: ds1307: remove clear of oscillator stop flag (OSF) in probe
> > >    rtc: ds1307: handle oscillator stop flag (OSF) for ds1341
> > > 
> > >   drivers/rtc/rtc-ds1307.c | 15 ++++++++++++---
> > >   1 file changed, 12 insertions(+), 3 deletions(-)
> > > 
> > > 
> > > base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
> > > -- 
> > > 2.49.0
> > > 
> 
> -- 
> GNU/Linux Solutions                  e-mail: giometti@enneenne.com
> Linux Device Driver                          giometti@linux.it
> Embedded Systems                     phone:  +39 349 2432127
> UNIX programming
> 

