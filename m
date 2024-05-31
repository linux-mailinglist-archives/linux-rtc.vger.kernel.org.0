Return-Path: <linux-rtc+bounces-1228-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CEA568D6321
	for <lists+linux-rtc@lfdr.de>; Fri, 31 May 2024 15:36:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 87DFD286863
	for <lists+linux-rtc@lfdr.de>; Fri, 31 May 2024 13:36:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38C18158D91;
	Fri, 31 May 2024 13:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TSV3yx26"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1160E33CF1;
	Fri, 31 May 2024 13:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717162589; cv=none; b=dk6tiDzEsd1hEJYcFMJuAISRyQpMutFrKcAmYTi9xZXGicQUYUzkkr7+zC7wq8WBhek6nm4t2DsSINVddS0wqjga8Ui7aqgfXjVGNTz81F9q/U7xwc1aK2Q/YvL+CmuIC6wR3vO3GJROHi//FNdrzeAvcl53pYU6TPh63rCcDKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717162589; c=relaxed/simple;
	bh=gf/hTHqh4wQYWgTtV+wMyboPa6r7AQpsapL7cucv+5w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h3DbZWFfV3yc5ZfgRoCZ08PCVySiS2AzyaLoW3H3uzqznaIOmN9bJeR0UJ9VQWuv56Z/BLNVoRDdZg5PblVEQMam9o4dmsNWHzvLitAskt5dd4cjUf9qpo8PW5g5vIHZbfTTPxcawzhLjDDokBjDsUb7M2nwrQUdXd6XcibMeHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TSV3yx26; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B068AC116B1;
	Fri, 31 May 2024 13:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717162588;
	bh=gf/hTHqh4wQYWgTtV+wMyboPa6r7AQpsapL7cucv+5w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TSV3yx26VoTRDb1Ue+c89VBR25aAMil7OSdarzxp8uu1olMLR1wx2wFiZJM0tLXA5
	 1HoVYWU9dojMkKmYPkJzGGxfob6MmzXSm7i7knNnnY95qUJGUml1e3eXpxWNgW4C+g
	 dpad2LIQvx6GDeFXByU/zlpzeUEkok/Sxq5EsS4z3W6NyKFEckq3BwkmEUQbVSMXir
	 W60D540GfSzalwjnd+RBKuCoOVztS1Ds6w5mci0Ky/lvn2W1MAebJ86wbPzUmHWFA8
	 DHvWmBdI4Fv+5HfmwwUEF2ntl9MMKiLG5cjrski+Ep2oo6x0CI3gAAxvTuOxqUolC7
	 F8UXDeoXsjFCg==
Date: Fri, 31 May 2024 14:36:24 +0100
From: Lee Jones <lee@kernel.org>
To: Richard Genoud <richard.genoud@bootlin.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Udit Kumar <u-kumar1@ti.com>,
	Thomas Richard <thomas.richard@bootlin.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Esteban Blanc <eblanc@baylibre.com>, linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/1] rtc: tps6594: Add power management support
Message-ID: <20240531133624.GJ1005600@google.com>
References: <20240515152827.80185-1-richard.genoud@bootlin.com>
 <20240515152827.80185-2-richard.genoud@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240515152827.80185-2-richard.genoud@bootlin.com>

On Wed, 15 May 2024, Richard Genoud wrote:

> Add power management support to the driver. This allows a SoC to wake
> from suspend using the nINT provided by the RTC.
> It takes care of the case when the interrupt has not been caught because
> the kernel has not yet woke up.
> (This is the case when only edges interrupt are caught)
> 
> Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
> ---
>  drivers/rtc/rtc-tps6594.c   | 46 +++++++++++++++++++++++++++++++++++++
>  include/linux/mfd/tps6594.h |  1 +

Acked-by: Lee Jones <lee@kernel.org>

>  2 files changed, 47 insertions(+)

-- 
Lee Jones [李琼斯]

