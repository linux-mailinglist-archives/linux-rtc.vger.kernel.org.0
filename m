Return-Path: <linux-rtc+bounces-4234-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3292DACFA61
	for <lists+linux-rtc@lfdr.de>; Fri,  6 Jun 2025 02:18:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6E0333A7D5C
	for <lists+linux-rtc@lfdr.de>; Fri,  6 Jun 2025 00:17:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78B405C96;
	Fri,  6 Jun 2025 00:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OvJ+oZ/m"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46A55A41;
	Fri,  6 Jun 2025 00:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749169082; cv=none; b=Sy5H6FTK/3Cr6+fpg6BJ97EaFFPNk37MTRXCQRIhMjyHBKhj29hpedt33SDOZpXohWMHJ6RhxOwcELLfc/nCHoUzEKWntr13aED+UglgRoj0fCA6xY4wm46+tcwipgrRB6F+ABc4Z0iHgGgMLIj5Zic7+3AQKa6eqjyIJa8KhWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749169082; c=relaxed/simple;
	bh=2JSpMRGXVXL3JU8MDRMXjV9RVRzGKz5jkToD6byfZsw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Izg2O1FgmJFRq9vbhJxIfJGKowD6qPWn2sNV4R9lKkW1eRKLBcJxvsTZpJYdg0dMb9uKz8CMxTGRCnFizn2vDXTVWt/F1+g5y2jvwwq+jHjWq//VnpBH/BRpqUudZ8OhndVzdedzMzB2aloO5WYlhPacHHgAduUzEAJkt8rjoSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OvJ+oZ/m; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8276CC4CEE7;
	Fri,  6 Jun 2025 00:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749169081;
	bh=2JSpMRGXVXL3JU8MDRMXjV9RVRzGKz5jkToD6byfZsw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OvJ+oZ/mLj+m2ihFhXa2gRLxNybNLg5BImHWyI69A1F2P7+GfMhLr7IJrlPovUrog
	 3xratbGa7NGEp68YERh01rJbrl7E+sALWK1yoQTggtxvZVHedwBB5LVlSAxE7vUw+l
	 GJDNLM7ULmffa7Qu8kmwTaeV3p2zlRz6vRMpYAxb5ik3C9ouvPv1OXSSx6NH7hNh/n
	 XWvKFyo0sag8MunwPYusfs/sU7Ok2F9QTNqrC4lNgOcwRN8VxHvevZNeGII6W7h34x
	 lWO3+rGLZwd3y1bKBdKxcMwoIlO+zLASZv3nYWkjI7x7qhctc7ORXs5XlziFSIW4GB
	 plhabQLuee6CA==
Date: Thu, 5 Jun 2025 19:17:59 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	imx@lists.linux.dev, linux-rtc@vger.kernel.org
Subject: Re: [PATCH 1/1] dt-bindings: rtc: nxp,lpc1788-rtc: add compatible
 string nxp,lpc1850-rtc
Message-ID: <174916907717.3619367.3745642154654809311.robh@kernel.org>
References: <20250602142842.942700-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250602142842.942700-1-Frank.Li@nxp.com>


On Mon, 02 Jun 2025 10:28:41 -0400, Frank Li wrote:
> Add compatible string nxp,lpc1850-rtc and fallback to nxp,lpc1788-rtc.
> 
> Fix below CHECK_DTB warning:
>   arch/arm/boot/dts/nxp/lpc/lpc4337-ciaa.dtb: rtc@40046000 (nxp,lpc1850-rtc): compatible: ['nxp,lpc1850-rtc', 'nxp,lpc1788-rtc'] is too long
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  Documentation/devicetree/bindings/rtc/nxp,lpc1788-rtc.yaml | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


