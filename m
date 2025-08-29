Return-Path: <linux-rtc+bounces-4789-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 65387B3C12F
	for <lists+linux-rtc@lfdr.de>; Fri, 29 Aug 2025 18:52:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 207DBA22DAD
	for <lists+linux-rtc@lfdr.de>; Fri, 29 Aug 2025 16:52:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E7EE334712;
	Fri, 29 Aug 2025 16:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ly+8Fkny"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E855225416;
	Fri, 29 Aug 2025 16:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756486337; cv=none; b=Zs01kmupiBy4UQIb/VNYIpYuZ1m6WVGzRxDjdxegP9UXSnI5wcnfQ3B0UP0rmFoMUPdd8lzNQXdk8nS3XJNOYcCbhYxLVvivO5EsAiNcGkw2zV8esOhayEikFrdzWe+NXEXGZLBL1oRV/m3PZ+BaX46HLTetvy2Pgx4YlyS34GE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756486337; c=relaxed/simple;
	bh=mQKuZkVQ4mgD98/6J2t49TPNC11S9BZI4VdHqx7xmek=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kZlCJ4nBf1pusuNPQBWV1Ugh9wH9Fc8994eJCvzeT2deIEXviwbtyfly7ly/742jGOGvPqALNR4jRUI9HfmcX6x1mS/SrYh2iaVlo7kniLOsMaIO+PXTtH15/hEJsIzUWmFa35kx6Rei+6+f+JOIS6+tHei3UNR1Xn1/J+NBJac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ly+8Fkny; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A53C6C4CEF0;
	Fri, 29 Aug 2025 16:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756486333;
	bh=mQKuZkVQ4mgD98/6J2t49TPNC11S9BZI4VdHqx7xmek=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ly+8FknyA6VC0PnHNMY/a/d/nLYfsb9THKPZi4XSVMXaoFDOGTKjN8cESjqv4TDfj
	 n/J3vN7BIgcTD2ieJrwKbzzqWBHKZkENwL6IhcNc6T0/6CqEIm6ToOGceRF0rbbOiM
	 NyRJn0UAYXnixL6iwFnXaxLeO7yt9v+vVdoCzc5MAq3vbVhaYuBzOPC9ae1IaE6Ozd
	 gFXnRLrQyoMmbWqOgOY5Avd6LVJ17PjU6Zct8xpH7Rtc7KgVKhFVDsAO1hrELc6TnQ
	 N4vs6R/T/yEnVEUKeWFomBKFKp/HbijWCDeZ7mwKDXFeQ/eXjmABK/2Tj84QQ5B1x9
	 tDHrej3EV7xIg==
Date: Fri, 29 Aug 2025 11:52:12 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Conor Dooley <conor+dt@kernel.org>, linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	imx@lists.linux.dev, Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH 1/1] dt-bindings: rtc: trivial-rtc: add dallas,m41t00
Message-ID: <175648633249.1003091.10018828879795875864.robh@kernel.org>
References: <20250827193356.78368-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250827193356.78368-1-Frank.Li@nxp.com>


On Wed, 27 Aug 2025 15:33:55 -0400, Frank Li wrote:
> Add compatible string dallas,m41t00 for dallas m41t00 RTC.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  Documentation/devicetree/bindings/rtc/trivial-rtc.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


