Return-Path: <linux-rtc+bounces-5030-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC0A1BA1C30
	for <lists+linux-rtc@lfdr.de>; Fri, 26 Sep 2025 00:13:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2EDB05618B8
	for <lists+linux-rtc@lfdr.de>; Thu, 25 Sep 2025 22:13:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D19C320CDF;
	Thu, 25 Sep 2025 22:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="hPknQP7I";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="lA61YFTe"
X-Original-To: linux-rtc@vger.kernel.org
Received: from flow-b2-smtp.messagingengine.com (flow-b2-smtp.messagingengine.com [202.12.124.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE72746B5;
	Thu, 25 Sep 2025 22:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758838396; cv=none; b=H2PJY02fDt/G1xgGCvlB4V8UpIu3UgTyjvXD5J/XublISAXcXujIZIGhXwXVSM6mVCYxUOOtSJHMbT5rUyYe2K434kDWEeDKY0CMIaBjq7MVnr5wDGX3edYKpwfA+b0qMIejErYOuHVQqvJrZhpXKKfbf+sIh+C7pY5z0hqo/C4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758838396; c=relaxed/simple;
	bh=RLVEm8TKjKjyOUDosja7lY9N2225leIPPpRAHlP9i7Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IBZOlH/TwiX1lUg2nfZC3C2APSk2HgQwEJcageWcZLpwT3cnZAPzLYxRJ2zacPsg2bSuDNC2PKAY3l/6ITL/YSE/fIz0UvnYd04wCmQpMpqvGDEQnKoZTqPl0MkKLyuk3uhZutY/VC6Ew+1fU9KbLmAXP3xOD+XpN4fzZ0TJr8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=hPknQP7I; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=lA61YFTe; arc=none smtp.client-ip=202.12.124.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailflow.stl.internal (Postfix) with ESMTP id 8C3A213000D4;
	Thu, 25 Sep 2025 18:13:13 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Thu, 25 Sep 2025 18:13:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1758838393; x=1758845593; bh=NPqIzxxCqz
	501l2T2BaB2Nu2Wi0UoMZvzBbrRhIgFq0=; b=hPknQP7Ib8/dPKgJghAIwp4B+e
	GO7CW9zWOtcNILi4be6e55oGgFUTpWvR91f8FYrGYH6D0AaJI5X1DT3+vHeq/bTN
	k+xqthJl8cN9iKWAyZI2BDaO4dGv9fmxmrq7b/ELLHhbAqihZmWbeMKScqkMDct9
	Z///nzLybxNkdsvCPd7ukjb27YKSKejLBL+82e+XpodPuy43xS+RVJNroSfSWeqT
	GYvfWJb/blVYudeDWF9qDNFTHYSO2lSFGfJM+nIdEVBglverRidfMtUqUsFqJL+n
	N0VUG9G/Bozo25Ppm1pjKkG/b4UF/s9UPW4wjkpr9XXPLxOGd97gAt0ONVMw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1758838393; x=1758845593; bh=NPqIzxxCqz501l2T2BaB2Nu2Wi0UoMZvzBb
	rRhIgFq0=; b=lA61YFTeMGQD7SdfAE6TX9ix5Dogy+/Vzn22MXRJ+1iTL7+V86V
	yAvixanKoJ9B+n+tDTiGYgvWeZBFKZ2H8luAfHvoOsuiTNXQl2tU04Ca//ulvUUw
	p3cYfT7B+Dq6uw5b+M97eFiPGDQEjU5CAKrQqEp5EB8fxEc6QO5dkIOE8xJNGtpr
	/jPFrZ7Dow9XjPTj/SNko15jtEdvktp52T1dIbaOWy4KJHXz0S5iWiLLdxrUNZpZ
	FWnfAvmzRt4vWoOYfMHZVp75E6+18Rm0eUcgncaF8NHcZpHCjLO0N8c8XJvSfYBg
	u4TtP8YnD3L3D8DzfK1b6C/BPko9T5gjBfA==
X-ME-Sender: <xms:eb7VaB0ijrXjuFef8Vf9O1Dsq4ghbiCEWJMFi4xPA4d57S3hE80EHQ>
    <xme:eb7VaObXpG2WMgVZ4kSTlMnM4VCYnQQWcWojc3N8LPy_kaW8hICzBF65zMdsFmpeM
    iVjDuZZgmSdh1pbgr14_abVU17A0D13NVuAxXwNFyVqCq44GGYw4vs>
X-ME-Received: <xmr:eb7VaOnnaFtJv44_4RBhYi4JllU-xDK2C56vB_wjQ8hxKq1UH2yMvlAptAourvs-0GutvDcHCEVsw_vMED23BnEAvARAoLgqbx4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdeijeeiiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehttdertddttdejnecuhfhrohhmpeflrghnnhgvucfi
    rhhunhgruhcuoehjsehjrghnnhgruhdrnhgvtheqnecuggftrfgrthhtvghrnhepgfdvff
    evleegudejfeefheehkeehleehfefgjefffeetudegtefhuedufeehfeetnecuvehluhhs
    thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhesjhgrnhhnrghurd
    hnvghtpdhnsggprhgtphhtthhopedvuddpmhhouggvpehsmhhtphhouhhtpdhrtghpthht
    ohepjhgtrghllhhighgvrhhoshelleesghhmrghilhdrtghomhdprhgtphhtthhopehsvh
    gvnheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghlhihsshgrsehrohhsvghniiif
    vghighdrihhopdhrtghpthhtohepnhgvrghlsehgohhmphgrrdguvghvpdhrtghpthhtoh
    eplhgvvgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdr
    ohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtth
    hopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghlvgigrghn
    ughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomh
X-ME-Proxy: <xmx:eb7VaNeMifx9zoubpJ2MYKko2bR9KdfdCrVsJJ9xpTEXQ0RlB3w8JA>
    <xmx:eb7VaM0oF3mL2R-0udCW5d6joZNd2Ai7eo3lODJTJ_9lW93NXM4EGw>
    <xmx:eb7VaKlyQic6Ai44_2MWDWfS52YpDq74sZ1QYqwmrRzKcQqNCYJgnQ>
    <xmx:eb7VaNZOLHJGXlyMaMMyqnEul-lrsNw-iNVnF_bPmBWQ4jTPlqWWLg>
    <xmx:eb7VaCBOG2XJmnt2zIs-X1lUBxCkSQJMieXer_VDjdSwiLq7ArbSxPPx>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 25 Sep 2025 18:13:12 -0400 (EDT)
Date: Fri, 26 Sep 2025 00:13:11 +0200
From: Janne Grunau <j@jannau.net>
To: James Calligeros <jcalligeros99@gmail.com>
Cc: Sven Peter <sven@kernel.org>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>, Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-input@vger.kernel.org,
	Mark Kettenis <kettenis@openbsd.org>,
	Hector Martin <marcan@marcan.st>
Subject: Re: [PATCH v2 00/11] mfd: macsmc: add rtc, hwmon and hid subdevices
Message-ID: <20250925221311.GF637503@robin.jannau.net>
References: <20250827-macsmc-subdevs-v2-0-ce5e99d54c28@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250827-macsmc-subdevs-v2-0-ce5e99d54c28@gmail.com>

On Wed, Aug 27, 2025 at 09:22:34PM +1000, James Calligeros wrote:
> Hi all,
> 
> This series adds support for the remaining SMC subdevices. These are the
> RTC, hwmon, and HID devices. They are being submitted together as the RTC
> and hwmon drivers both require changes to the SMC DT schema.

I we would instantiate all sub devices via MFD_CELL_OF macsmc-hid (or
-input) and the omitted macsmc-power would require SMC dt-binding
changes as well. I'm conflicted on that since both use SMC to determine
if they are present.

Janne

