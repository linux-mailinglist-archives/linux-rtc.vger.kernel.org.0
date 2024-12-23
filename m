Return-Path: <linux-rtc+bounces-2756-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 669269FAB0A
	for <lists+linux-rtc@lfdr.de>; Mon, 23 Dec 2024 08:27:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DD90F1651F8
	for <lists+linux-rtc@lfdr.de>; Mon, 23 Dec 2024 07:27:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 441B318A92F;
	Mon, 23 Dec 2024 07:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gPUPbqBW"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E963918052;
	Mon, 23 Dec 2024 07:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734938867; cv=none; b=pZBsEVQ5OGLgQ9Ezh6h6Myc2+H0SDX3fKeoETSaqsJcdWVN0CQvoZoKYg1qnI+picUMugmGyEtKBWrgXuOu7DxdngqPVEyVpTX8FDRgtHl9ZHiFpXFpeUBBXGV9unGGa4Lmgj+3k2l3racz0p1HF6tyDUveiSLZfT1OdYYgZsNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734938867; c=relaxed/simple;
	bh=VZyd4V5fwAkkf6j2lzdZSBdLb/bZPRnsMDycIJWbfl4=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=nH8F/tKdD9JfwCVW9GKXk+rv2M45KoIqnLjWmcPW2AvrmYrpX3YL0rd6Ezk9aM+1UU8nxxYGwrQTsDO4VKLg2ibjJHAOv5g6ZdizQpePk5tNMeDmC1mp5nIm1nSEB6KH/j+Hfd+Hkxz4xq0faWhCmUl27x2tbLiM3SN+3uqMrqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gPUPbqBW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F6E8C4CED4;
	Mon, 23 Dec 2024 07:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734938866;
	bh=VZyd4V5fwAkkf6j2lzdZSBdLb/bZPRnsMDycIJWbfl4=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=gPUPbqBW7Zz0bqr3n+Q0DP7j1MuOJkmRg+E2AlJCXgxlIQmbM3BCjoKCGGaGZE9C5
	 WPdcBZv2DlM3zsGAMvCu4PYQ0sXFsWgzBhxud2++xpZrvTK2w53AGjoIfeBJETHp+5
	 btqsVYmMoX4xwBo+VwFgRTwyvamY+h06FWP3yJaK+xLLpE43n+H8SvseUcuxKwl3JO
	 uizKVyzVyT4QKdSlX2U3DB65Z6FkB4WugmYcFUTPQmcar+kOxuTW7ZivB2BReeE145
	 z/dq0VPW6EX/6dyGpmWb2J8bIrYDSt98Bd3+GDzk9CRxa1vuEezMnxNa59VqtEnYFW
	 i3Svv7mEn+cjg==
Date: Mon, 23 Dec 2024 01:27:44 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-rtc@vger.kernel.org, 
 Jean Delvare <jdelvare@suse.com>, 
 Antoniu Miclaus <antoniu.miclaus@analog.com>
To: PavithraUdayakumar-adi <pavithra.u@analog.com>
In-Reply-To: <20241223-max31331-driver-support-v1-1-f9499bd598f5@analog.com>
References: <20241223-max31331-driver-support-v1-0-f9499bd598f5@analog.com>
 <20241223-max31331-driver-support-v1-1-f9499bd598f5@analog.com>
Message-Id: <173493886450.3944320.9770471045980909625.robh@kernel.org>
Subject: Re: [PATCH 1/2] dtbindings:rtc:max31335:Add max31331 support


On Mon, 23 Dec 2024 11:57:44 +0530, PavithraUdayakumar-adi wrote:
> Add support to max31331 RTC chip in adi,max31335.yaml
> 
> Signed-off-by: PavithraUdayakumar-adi <pavithra.u@analog.com>
> ---
>  .../devicetree/bindings/rtc/adi,max31335.yaml      | 32 ++++++++++++++++++----
>  1 file changed, 26 insertions(+), 6 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/rtc/adi,max31335.example.dts:23.20-31.15: Warning (i2c_bus_reg): /example-0/i2c/rtc@68: I2C bus unit address format error, expected "69"

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241223-max31331-driver-support-v1-1-f9499bd598f5@analog.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


