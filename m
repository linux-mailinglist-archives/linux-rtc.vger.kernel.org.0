Return-Path: <linux-rtc+bounces-5029-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D56E1BA1B93
	for <lists+linux-rtc@lfdr.de>; Fri, 26 Sep 2025 00:03:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EDE711C84040
	for <lists+linux-rtc@lfdr.de>; Thu, 25 Sep 2025 22:03:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04DBB31B824;
	Thu, 25 Sep 2025 22:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="UWGOpYJ6";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="G2xnt1E7"
X-Original-To: linux-rtc@vger.kernel.org
Received: from fout-b7-smtp.messagingengine.com (fout-b7-smtp.messagingengine.com [202.12.124.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B32DD30DD06;
	Thu, 25 Sep 2025 22:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758837779; cv=none; b=gf86tJHCLB+TEmZLnfm/5/XFxLnUBqg2qdu5UnR1w4Jma+aocu7rOwoNa7rEpHXKE3/WtqWCiICRj6oQxKOsGzieewAG6oXzLMHcoKmzVrJknisq9EwL36cwkpsbfdN5n6BlyCk8/ZhOcaU7uW18g15yKJT8Z7E4gl9I+kNUQPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758837779; c=relaxed/simple;
	bh=j4vkRyM73R3SGtlqBTycbcCvNRyGfbUPruoXDGnn8dg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MDee14irB6EFzIvhMOSU0L4QLr/DGeS5Cz4UkPY5sMcWXu5KC/nrE2Iy3prsZp5guhzcr4ziFaxWdU4E7IoW3tf5RQJ4M0tAQTYYdDQIMPsnVyhI7j1dB0TfnI9Jj/q5Ph5qV9szeMMXKIBdyRv21zWjg4EzskwZeQxCG3rtOhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=UWGOpYJ6; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=G2xnt1E7; arc=none smtp.client-ip=202.12.124.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id 8C48B1D0001C;
	Thu, 25 Sep 2025 18:02:56 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Thu, 25 Sep 2025 18:02:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1758837776; x=1758924176; bh=45q2RfxgPL
	2RPs1UTa/vp3a4iK6CtTwGXX+rlUIY7e4=; b=UWGOpYJ6CBLaUH3lP0939qUdp8
	oIkBJg4b59HUGa+sGLQi5FJeYdcB/G+n+XIEojAEhKKMUIWt0ePF7LvONkYuqZE4
	IcFMuwW28xRzu3u3d/LcBr4AsEtk8OJocP1B96QSrCY1X1EEUnDEVOdLSJl0tvMH
	/hW+h3eA19yYRZhslKNEzLZVjbxD2oAelB2mF4ZH0B7GTB54jnGIticrcRSpXXIC
	VCxMdP8Gb0jmQg5VqpXMT923cSjl/eGlI3fgD3BnQmvZ5ZfbPgelnDhPXZkutynE
	M5q5hQqWUws4z2DFueDPRkLyMHeDlv+wgocAscFGEgSDluv/hCNNBC5G2JBw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1758837776; x=1758924176; bh=45q2RfxgPL2RPs1UTa/vp3a4iK6CtTwGXX+
	rlUIY7e4=; b=G2xnt1E7zv+0TEUQksFp5Bb7hUTt/noMfIK6VjGRxfYV08dHOn4
	kt0lYp9p3mV7sbBdKBr/Ela64eT+uNcK5WABxkJIoKAU0C9JtmVCtkoMtcYQKziu
	47awA01Co19sIx8Vi063ASKB97zuVe4pa6pjRU600C4aPzSZu9TTw55eM5etri8i
	skGrF9A0Na8ZQeHu4I9vDuUH/PT4T20iTJep1r/0JNQtO4zM/jFWNZ9rb2Ev+L8/
	k+GcFs1UP7DgeFDdT2MGvmCQ3aeuh69TNT5ETXV9gQVBhywWZ0yqknaqwbU94cQP
	4YNT8R51TVIpHDCmxxI9g9f5g+Vst0t/5HA==
X-ME-Sender: <xms:D7zVaHdDwSU7-i24NUP40ENlshVsImBeqs_TR6P8BTE0nuCf8oPagA>
    <xme:D7zVaJHynfWtGe2VtM2ux6S9_pVUaGOwYQ07cQ7qDifsTzMwr5kx-KmmAznS1DKEv
    ZOcokBWhNf05R-8Hzr_us6sGJiVG-ULaMlibZ1L6Xk2ISUTlLkCOms>
X-ME-Received: <xmr:D7zVaMB07uC71mt2yTVFGE-MSToNSClmWVhJSXWx60Y9nfm6InLvoYASM6Q-TpTF-txdE0bXAXKu1ZQHr5w6zCcu1DA7zw2B9f8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdeijeeigecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehttdertddttdejnecuhfhrohhmpeflrghnnhgvucfi
    rhhunhgruhcuoehjsehjrghnnhgruhdrnhgvtheqnecuggftrfgrthhtvghrnhepgfdvff
    evleegudejfeefheehkeehleehfefgjefffeetudegtefhuedufeehfeetnecuvehluhhs
    thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhesjhgrnhhnrghurd
    hnvghtpdhnsggprhgtphhtthhopeduledpmhhouggvpehsmhhtphhouhhtpdhrtghpthht
    ohepjhgtrghllhhighgvrhhoshelleesghhmrghilhdrtghomhdprhgtphhtthhopehsvh
    gvnheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghlhihsshgrsehrohhsvghniiif
    vghighdrihhopdhrtghpthhtohepnhgvrghlsehgohhmphgrrdguvghvpdhrtghpthhtoh
    eplhgvvgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdr
    ohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtth
    hopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghlvgigrghn
    ughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomh
X-ME-Proxy: <xmx:D7zVaM4f33altnetDoyGCGAuXKPZpJUQzcMCvu3hbliXcsJ2EbMXJQ>
    <xmx:D7zVaLlX54RiZDd0NVg_pxNK6WcEk5SZ_5iBcd4nnLWqts4MHhKgNA>
    <xmx:D7zVaF4mOHwi_NKCjr6py86kDM_Oj5AknOBXQgN4scbAEzaMbHkaXw>
    <xmx:D7zVaJXr0kKu-tI4bL74Wpn-nKWh7XaaJQhRwquku5tnWMJrAS0nNQ>
    <xmx:ELzVaD-j4wqPauB1cCsZcJESH2PPmoAtWPNuPvIgMz8-jEHql9-jyh3j>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 25 Sep 2025 18:02:55 -0400 (EDT)
Date: Fri, 26 Sep 2025 00:02:54 +0200
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
	linux-hwmon@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [PATCH v2 10/11] arm64: dts: apple: Add common hwmon sensors and
 fans
Message-ID: <20250925220254.GE637503@robin.jannau.net>
References: <20250827-macsmc-subdevs-v2-0-ce5e99d54c28@gmail.com>
 <20250827-macsmc-subdevs-v2-10-ce5e99d54c28@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250827-macsmc-subdevs-v2-10-ce5e99d54c28@gmail.com>

On Wed, Aug 27, 2025 at 09:22:44PM +1000, James Calligeros wrote:
> Each Apple Silicon device exposes a unique set of sensors and fans,
> however some have been found to be reliably common across devices.
> 
> Add these as .dtsi files so that they can be combined with any
> device-specific sensors without excessive repetition.
> 
> Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
> ---
>  .../boot/dts/apple/hwmon-common.dtsi     | 37 +++++++++++++++++++++++++
>  .../boot/dts/apple/hwmon-fan-dual.dtsi   | 24 ++++++++++++++++
>  arch/arm64/boot/dts/apple/hwmon-fan.dtsi | 19 +++++++++++++
>  .../boot/dts/apple/hwmon-laptop.dtsi     | 35 +++++++++++++++++++++++
>  .../boot/dts/apple/hwmon-mac-mini.dtsi   | 17 ++++++++++++
>  5 files changed, 132 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/apple/hwmon-common.dtsi b/arch/arm64/boot/dts/apple/hwmon-common.dtsi
> new file mode 100644
> index 0000000000000000000000000000000000000000..bac4e44d3f9892fe8ad04125e47dcccb2bcf57a0
> --- /dev/null
> +++ b/arch/arm64/boot/dts/apple/hwmon-common.dtsi
> @@ -0,0 +1,37 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
> +/*
> + * Hardawre monitoring sensors expected to be found on all Apple Silicon devices

typo: "Hardawre"

> + *
> + * Copyright The Asahi Linux Contributors
> + */
> +
> +&smc {
> +	hwmon {
> +		compatible = "apple,smc-hwmon";

I think it woiuld make more sense to add the hwmon child node with the
compatible in the SoC *.dtsi and then only add the sensor nodes to
"&smc_hwmon" in these hwmon-*.dtsi files

Janne

