Return-Path: <linux-rtc+bounces-1459-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63B3E92C20D
	for <lists+linux-rtc@lfdr.de>; Tue,  9 Jul 2024 19:15:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C1D55B2E67B
	for <lists+linux-rtc@lfdr.de>; Tue,  9 Jul 2024 17:01:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7294719E827;
	Tue,  9 Jul 2024 16:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OcDj//x7"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 484EB19B5BA;
	Tue,  9 Jul 2024 16:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720542641; cv=none; b=erpkQxiiMnqC665pXADrmppG+ctyRiFMec5cgoKQTD0BsT4QHeGDLm6zd28UTg07ManPZ34AFlVn44QuyExNzSHEOB+NmZc7ok1p1iXdXUDXhj7ketgZnXlkccjOq9DHZkSVJW+wut/3a4gnah2AaqAEeefCGhS0HYcmvFq+sBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720542641; c=relaxed/simple;
	bh=UKvAsz1g4fnOhjjLhryynx4MnRPSHIJ84qICpjwLHE0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IRgLxCJeLnVIW8QEKEOCM2gjjxCLAsInmGQutA8hdWIZC7f6P7de+h9+aY4HnFlm8DAQEqs6yMj6l2a88Pb2TRxMV+RgVxTp1TNdM2tbuW+Awcig6RmwC5/WjDo8iqLMiKN7LZOhAqP+7Rg3TzQqo5p6EYViEp9YQyoZXsJSKiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OcDj//x7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A9B5C3277B;
	Tue,  9 Jul 2024 16:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720542640;
	bh=UKvAsz1g4fnOhjjLhryynx4MnRPSHIJ84qICpjwLHE0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OcDj//x71lzAXPBTyD2LF+AFXbTXO0eT0YRpKj7V0MLPCfbQ5jVnxu1Ek9cOWy+Qf
	 scFvukXODhmmZvouxZBh3vRGgHJZFG6ETDbCGpRJfyzeA/VretAxeLqqZqUndnnJnP
	 NI6mfm+vRk8IOo1eMYd9bA+pxAirZBWjBZvsD3HsebwLXQzJwxxmThSqkwAckO7/aw
	 ZO+ziOXinTvU9mmCIbgZSCGrHXIrTBYgWRvmlnaQ+ssu+OIFcxS3BvP5lEzkFrLA3Y
	 u3Sx+1gdmw43NUajbpSF6Iho9R/KboZyP67DQvWKbGC5iJo/JbwI/Pxd1l83z6rBE8
	 tL1xrH3JshPNA==
Date: Tue, 9 Jul 2024 10:30:39 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Valentin Caron <valentin.caron@foss.st.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: rtc: stm32: introduce new
 st,stm32mp25-rtc compatible
Message-ID: <172054263823.3749406.8767907445542011155.robh@kernel.org>
References: <20240708153434.416287-1-valentin.caron@foss.st.com>
 <20240708153434.416287-2-valentin.caron@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240708153434.416287-2-valentin.caron@foss.st.com>


On Mon, 08 Jul 2024 17:34:33 +0200, Valentin Caron wrote:
> Introduce new st,stm32mp25-rtc compatible. It is based on st,stm32mp1-rtc.
> 
> Difference is that stm32mp25 soc implements a triple protection on RTC
> registers:
> - Secure bit based protection
> - Privileged context based protection
> - Compartment ID filtering based protection
> This driver will now check theses configurations before probing to avoid
> exceptions and fake reads on register.
> 
> Link: https://www.st.com/resource/en/reference_manual/rm0457-stm32mp25xx-advanced-armbased-3264bit-mpus-stmicroelectronics.pdf#page=4081
> Signed-off-by: Valentin Caron <valentin.caron@foss.st.com>
> ---
>  Documentation/devicetree/bindings/rtc/st,stm32-rtc.yaml | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


