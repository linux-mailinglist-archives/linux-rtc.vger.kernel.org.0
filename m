Return-Path: <linux-rtc+bounces-3533-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B92A6582F
	for <lists+linux-rtc@lfdr.de>; Mon, 17 Mar 2025 17:34:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 415FD3B5F87
	for <lists+linux-rtc@lfdr.de>; Mon, 17 Mar 2025 16:34:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 414891A00D1;
	Mon, 17 Mar 2025 16:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sI7c89dq"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B1A619E968;
	Mon, 17 Mar 2025 16:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742229288; cv=none; b=b7fc7fVz8QYY2EdJ3OeKJr1KsVltsjLMcU8Y1bFTgeDqcorCZx0Se7lxUftZKAb3C04CEHfwCrBF8TejLyr8kLYnmF3zFWMyEYLjkqii+99Hu3+WEzFI6rqVr8UDmvtbSjLDpo0YymxtXk4HzuJW9aYzadWZmY0euQyzpIknDYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742229288; c=relaxed/simple;
	bh=qspb2BJvd/G4/SNA2uJmUEBlswLyBrDoy8bN1fSYA2U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hj63TNu/o6ZG855WDNt0eg947hcutLEiZ+e7WqiHq938mYyD+J0BKRSeDhLNdAb1ucopx6Gezlbi3uINeb4d9dWdHDt8X3KQ8GY0EhJapvSRRKUtQoZvdFPKLavOFgGEHiQ000NMe42uptOlvU00c+B49psvT2JJaZC1pvHE3Ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sI7c89dq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 486DEC4CEEC;
	Mon, 17 Mar 2025 16:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742229287;
	bh=qspb2BJvd/G4/SNA2uJmUEBlswLyBrDoy8bN1fSYA2U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sI7c89dqF2FkQHAHT5V9IvUN1zyNlIPsSoiJU4JvxvXLgQdJEdb8MpPp+pC0nMzb1
	 WdQmfgcXilKwzPoWzJ0ZroEFRkaQDiz9ez/niHqc0hlStumy1VcWabzJPMa6+UqIZb
	 CSsRHPWPBZAyhTxRx/c5pCDvpzuaSEKAJKFZ20qkHVoL/MLJAqCDeAzJr99Elret08
	 yufgiHcK7x3LADr+qSymLZliXOt/S8wPPmsQOFpKc6qwFjw48XmEH9eWtdtExbRYBA
	 Pyh5ok409IPvLW5sez49qL4CilOzwVSUsXkDWiRrTMJcZ8nORkfkvQYtu5HEPT2l3i
	 BE9qcX/T+EtIA==
Date: Mon, 17 Mar 2025 11:34:46 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Fabio Estevam <festevam@gmail.com>
Cc: linux-rtc@vger.kernel.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org, alexandre.belloni@bootlin.com,
	krzk+dt@kernel.org, Fabio Estevam <festevam@denx.de>
Subject: Re: [PATCH v2] dt-bindings: rtc: pcf2127: Reference
 spi-peripheral-props.yaml
Message-ID: <174222928500.182990.13018649757541617435.robh@kernel.org>
References: <20250317120356.2195670-1-festevam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250317120356.2195670-1-festevam@gmail.com>


On Mon, 17 Mar 2025 09:03:56 -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> PCF2127 is an SPI device, thus its binding should reference
> spi-peripheral-props.yaml.
> 
> Add a reference to spi-peripheral-props.yaml to fix the following
> dt-schema warning:
> 
> imx7d-flex-concentrator.dtb: rtc@0: 'spi-max-frequency' does not match any of the regexes: 'pinctrl-[0-9]+'
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> ---
> Changes since v2:
> - Specify that the dt-schema error comes from imx7d-flex-concentrator.dtb.
> - Write a more concise commit log.
> 
>  Documentation/devicetree/bindings/rtc/nxp,pcf2127.yaml | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


