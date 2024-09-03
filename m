Return-Path: <linux-rtc+bounces-1860-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3119596A0FB
	for <lists+linux-rtc@lfdr.de>; Tue,  3 Sep 2024 16:45:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DA2731F238C3
	for <lists+linux-rtc@lfdr.de>; Tue,  3 Sep 2024 14:45:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E43C9154C1D;
	Tue,  3 Sep 2024 14:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uFwX5QNs"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B84741547DA;
	Tue,  3 Sep 2024 14:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725374743; cv=none; b=nJ9SYl3xbad/WecOv0xk7oHGZJTL0D7tWQ3AwE+HHC7Xun9Xd4m2qtxaZYBa04PkFKzL/ubs9dIAs4YWlxHdpzVjU1KR3PkdvR++KBMKejfScshN7lCHvZOQqLHOjWaFosrdoiM3i8h1dTzMFohjUAN0Fy2upeEM2KHMxd95Gzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725374743; c=relaxed/simple;
	bh=iSDAPXcfXfi99MJkJaU478Nz0GEXXstJ4Q3Am5fSk+U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ul4UF9QUCsF1aCtfZBLpv/y1DTVv3txZEIKj36Iqo+wE311GOMh8va7QXf5v9DFqVgLkiZcqyvJpBMC0xFOYfVhALcqVtU+ExuR1YhsX/rUopost6Mu+mDTdzR9xv2tp4KpdTJIWycrUGYjwf+jxQ+sGPXC5O54/dRODF1F8NNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uFwX5QNs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 153E1C4CEC7;
	Tue,  3 Sep 2024 14:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725374743;
	bh=iSDAPXcfXfi99MJkJaU478Nz0GEXXstJ4Q3Am5fSk+U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uFwX5QNs7hy9CFQx6BrFceUzU381Ex4ft3CHyRWKb6VMideDik8I7r4S8s8J5edC0
	 XYs8gbnz1hRDvGh0qgbsnlpyPexKgxqGiULFprJHMC/zJh1HwWswe1AmSn0buV4GSo
	 v5o5XiS/456Dr7W9EP7C8ZlOF09s/p/Fjfeh7exl/OTvIMrtwoENk018lBrPgfhBEz
	 oW8iWpC/Z27HPBAr/kzJkTbHLeMuk6V1EG5bF2Ljgckd0okY05AXfI9ymzbVWRS67w
	 FyWwI1S4a8WOHuU7+jemqYWUWxzRST1rKdonquAkpwaxR7rwt3neLL4c2+wQfqIDhw
	 lC4KDofd7NYQw==
Date: Tue, 3 Sep 2024 09:45:42 -0500
From: Rob Herring <robh@kernel.org>
To: Karthikeyan Krishnasamy <karthikeyan@linumiz.com>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, heiko@sntech.de,
	alexandre.belloni@bootlin.com, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org
Subject: Re: [PATCH v2 5/8] dt-bindings: rtc: microcrystal,rv3028: add
 clock-cells property
Message-ID: <20240903144542.GA985263-robh@kernel.org>
References: <20240903105245.715899-1-karthikeyan@linumiz.com>
 <20240903105245.715899-6-karthikeyan@linumiz.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240903105245.715899-6-karthikeyan@linumiz.com>

On Tue, Sep 03, 2024 at 04:22:42PM +0530, Karthikeyan Krishnasamy wrote:
> consume clkout from rv3028 rtc which is able to provide
> different clock frequency upon configuration

Please write complete sentences.

The subject is wrong. There is no such property 'clock-cells'.

> 
> Signed-off-by: Karthikeyan Krishnasamy <karthikeyan@linumiz.com>
> ---
> 
> Notes:
>     v2:
>     - fix commit message subject
> 
>  Documentation/devicetree/bindings/rtc/microcrystal,rv3028.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/rtc/microcrystal,rv3028.yaml b/Documentation/devicetree/bindings/rtc/microcrystal,rv3028.yaml
> index 5ade5dfad048..cda8ad7c1203 100644
> --- a/Documentation/devicetree/bindings/rtc/microcrystal,rv3028.yaml
> +++ b/Documentation/devicetree/bindings/rtc/microcrystal,rv3028.yaml
> @@ -22,6 +22,9 @@ properties:
>    interrupts:
>      maxItems: 1
>  
> +  "#clock-cells":
> +    const: 0
> +
>    trickle-resistor-ohms:
>      enum:
>        - 3000
> -- 
> 2.39.2
> 

