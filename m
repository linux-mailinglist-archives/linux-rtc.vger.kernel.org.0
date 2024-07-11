Return-Path: <linux-rtc+bounces-1491-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D762D92F25A
	for <lists+linux-rtc@lfdr.de>; Fri, 12 Jul 2024 00:56:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 147FD1C221D7
	for <lists+linux-rtc@lfdr.de>; Thu, 11 Jul 2024 22:56:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EF4F1A01DF;
	Thu, 11 Jul 2024 22:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PgIrD0AN"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2335616D4E8;
	Thu, 11 Jul 2024 22:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720738608; cv=none; b=gq34LUkE3scR9geVMvCiVss7igk4y7xMwLtqmjS4yuBolfvE7K13eos9RpryUsWcFbGfxfc/RBQvRs2vM2ZeCPaednt/TOdQTqCDtFxS4/OR/PRo/jdoRFXO+N6hRhG2Kmyuium4Ep6hKP7ZcWC+XV/jBfWnzWM6Ah9BaOd+8Hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720738608; c=relaxed/simple;
	bh=wED/ceXj3SCfyfRABZxVMDXqp+ySf1JiZO58sZxJTvY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lVyQkAjMQILGMF/MjSolM4kEr2Q23mEn+J6mB0DU3TtKJ3r7Qw2p8RauX+od7kSV4Gawpv7h1UR2h+Tsb8RHeZ5B2igwQ19ms/+Hf0AqHSccLe+Yex2IaZr/K7PsKoUZ54b8TfWHaESnbriCs0ukOrO2X0QiZ14gE8bh8Yszklg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PgIrD0AN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CB1DC116B1;
	Thu, 11 Jul 2024 22:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720738607;
	bh=wED/ceXj3SCfyfRABZxVMDXqp+ySf1JiZO58sZxJTvY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PgIrD0ANTFLW/WvPS/Q/nCg9ViROWv8tS/RbiRZKKzbOvPTc2DERFZJIsYS/5y1ig
	 ncu4PDANpIg7Cfm166EcrdSLVi3P88jWnCSZVcEo/5JZlG98SOC+OdYxdD8w9qFO8x
	 1OXTq58n0B2dHgw0XKAW+mmMq2ZKcA14Zet9UL99KzLZRaPy8aouO0wUnyYVcsbsDr
	 opiEFgelizNv8fnOgoS8UpHjeJzYYJaBWYDaffzYVS2Nd0wye95Xdk5Aocl1cfX4Ps
	 h8OTzOjOoIGRlQezULAWjuSsYQqVzzNDGrUigniYN+5NNS1Vqo+2opMgkthv6WCwyr
	 4XwrHaux5pwfQ==
Date: Thu, 11 Jul 2024 16:56:46 -0600
From: Rob Herring <robh@kernel.org>
To: Valentin Caron <valentin.caron@foss.st.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Amelie Delaunay <amelie.delaunay@foss.st.com>
Subject: Re: [PATCH 1/4] dt-bindings: rtc: stm32: describe pinmux nodes
Message-ID: <20240711225646.GA3270567-robh@kernel.org>
References: <20240711140843.3201530-1-valentin.caron@foss.st.com>
 <20240711140843.3201530-2-valentin.caron@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240711140843.3201530-2-valentin.caron@foss.st.com>

On Thu, Jul 11, 2024 at 04:08:40PM +0200, Valentin Caron wrote:
> STM32 RTC is capable to handle 3 specific pins of the soc (out1, out2,
> out2_rmp) and to outputs 2 signals (LSCO, alarm-a).
> 
> This feature is configured thanks to pinmux nodes and pinctrl framework.
> This feature is available with compatible st,stm32mp1-rtc and
> st,stm32mp25-rtc only.
> 
> Signed-off-by: Valentin Caron <valentin.caron@foss.st.com>
> ---
>  .../devicetree/bindings/rtc/st,stm32-rtc.yaml | 28 +++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/rtc/st,stm32-rtc.yaml b/Documentation/devicetree/bindings/rtc/st,stm32-rtc.yaml
> index 7a0fab721cf1..09221c2f8a0c 100644
> --- a/Documentation/devicetree/bindings/rtc/st,stm32-rtc.yaml
> +++ b/Documentation/devicetree/bindings/rtc/st,stm32-rtc.yaml
> @@ -53,6 +53,28 @@ properties:
>        override default rtc_ck parent clock phandle of the new parent clock of rtc_ck
>      maxItems: 1
>  
> +patternProperties:
> +  "^rtc-[a-z]*-[0-9]+$":

rtc--123 is valid? "*" should be "+"

Otherwise,

Reviewed-by: Rob Herring <robh@kernel.org>

