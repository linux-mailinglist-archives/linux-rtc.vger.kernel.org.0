Return-Path: <linux-rtc+bounces-4373-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5146EAEACDF
	for <lists+linux-rtc@lfdr.de>; Fri, 27 Jun 2025 04:39:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B8D714A684C
	for <lists+linux-rtc@lfdr.de>; Fri, 27 Jun 2025 02:39:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E32D1925BC;
	Fri, 27 Jun 2025 02:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oWcDR9Cj"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF3117C211;
	Fri, 27 Jun 2025 02:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750991946; cv=none; b=mkOAxchYGLVzfd6hFPSa8fFkk8s9X++X2KMY4Ds1Duls4jIPZM6kuinqBul2zsEPHY0CFNRFCGd0n4BgIUyX/56baLGVQZPO8CwMBXYzbux4ntzE4XXpj1u5yyW4laUU48IU6TQpMq6IMBV7/7P3V9kKjGoKzP1JvGCzFEW9QWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750991946; c=relaxed/simple;
	bh=GXhtp+iymbshimIYRdDqgXF96BjgA479pHwlJ8aPRro=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aBdSFyUBOMnQhw1811ZC2zVPvda4I96agte/bWLbrV/efBPfAklP2rFlhlLK0MoExHXkAoclbXbhr1mKBwlriUsrevkjipDLtzRPjWSp8TcUIzATUIqIrcfrAPc3qN4DSEoujmwcAClhbcE6MvgUzPV+/ECyXZ9xCfTzI9OcWQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oWcDR9Cj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0DF7C4CEEB;
	Fri, 27 Jun 2025 02:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750991944;
	bh=GXhtp+iymbshimIYRdDqgXF96BjgA479pHwlJ8aPRro=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oWcDR9CjVvOaP7EncINx6t77o2KqLpnPp44cOGNHNhTkYqrZi3ERYbfCIUpqd+CmL
	 NhMl3iqFo2yk3Fd1OSSJqaylWAvSXrv5PjkXbo25J2VXOSBT4jr8B6dMQPi8MKVN43
	 VjOeXjW8ORrVEI+/pV1g3JK9K6R/FqjJLdRI914rCkur2X4+Z4ZtVMcKO5kI8/il58
	 A3HizFIBhljre1jTIsZrALsI6y8WaVutzfIkUlOM/IpLKp1h/lnEsn0Xi2DXPWnFf+
	 E/WLXW67IwccW2kRx3ghYtF9JWIJLa2Ps7mquS7useYGf4Kxm2WsDM/ZpMZ2LiSeDk
	 l5nvi2atzHIfg==
Date: Thu, 26 Jun 2025 21:39:03 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Alex Elder <elder@riscstar.com>
Cc: lgirdwood@gmail.com, paul.walmsley@sifive.com, conor+dt@kernel.org,
	krzk+dt@kernel.org, dlan@gentoo.org,
	linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alexandre.belloni@bootlin.com, alex@ghiti.fr,
	lee@kernel.org, mat.jonczyk@o2.pl, spacemit@lists.linux.dev,
	guodong@riscstar.com, broonie@kernel.org,
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
	troymitchell988@gmail.com, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 1/7] dt-bindings: mfd: add support the SpacemiT P1 PMIC
Message-ID: <175099194313.1647535.17793298958776531103.robh@kernel.org>
References: <20250626141827.1140403-1-elder@riscstar.com>
 <20250626141827.1140403-2-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250626141827.1140403-2-elder@riscstar.com>


On Thu, 26 Jun 2025 09:18:20 -0500, Alex Elder wrote:
> Enable the SpacemiT P1, which is an I2C-controlled PMIC.  Initially
> only the RTC and regulators will be supported.
> 
> Signed-off-by: Alex Elder <elder@riscstar.com>
> ---
>  .../devicetree/bindings/mfd/spacemit,p1.yaml  | 86 +++++++++++++++++++
>  1 file changed, 86 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/spacemit,p1.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


