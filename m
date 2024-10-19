Return-Path: <linux-rtc+bounces-2252-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C81A9A4CE1
	for <lists+linux-rtc@lfdr.de>; Sat, 19 Oct 2024 12:32:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7045D1C21209
	for <lists+linux-rtc@lfdr.de>; Sat, 19 Oct 2024 10:32:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07D2B1DF72C;
	Sat, 19 Oct 2024 10:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qX4injw6"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B084818E022;
	Sat, 19 Oct 2024 10:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729333973; cv=none; b=dIdAe/fdc12kxs4XLt5glneEGuWiySI8Miah828fZ15URj/193IdwAFoJTGqAiRaoUq65y1wqR5cIeCdzJ9nfCghHLx9kz7blm/4yHuhq3Fnwweqzx13eH1XmVHGKk0qdqIbs+UGMFxZdgV/kVxQd85m8RWcaGZ8bJoozN9uUhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729333973; c=relaxed/simple;
	bh=vCdvQlxKqra+X74MargcJiMMmT07oNyB3P22eXEaw+Y=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=NPq8Ad+8Gc13fJor+MXJvcqpN7uMLKMmL23U3+s6qp3MsD2HsVlWbH8zZyVtL7mMs3LBH9U9646Op/S5zmPm2NPLq1aFiVjRrcXB7hE1nl+3bTMvB5LykBoTdis61yfIa8jwDDniBegpilng2gWvv48brZpXoWGD4g+a+NNg0yU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qX4injw6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49B4FC4CEC7;
	Sat, 19 Oct 2024 10:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729333973;
	bh=vCdvQlxKqra+X74MargcJiMMmT07oNyB3P22eXEaw+Y=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=qX4injw6jVjLbfg6w4i5WKZlROHelEl0wJhIMv9ryhsWNIY4ui79gkeDIUBkRzzwv
	 TBjlmZGi0StUB/KYR0EnKwqhrQ+eVBXZtOt6csrGbgfdDvKwEg/c48qF0yBvpdp5oS
	 TrxdbAWpYzVv4I2k6TRHYq3BS4o9WEQMfApxACeCP/aouNW3KTk6Q0d3LYSOLEcxWm
	 iAhcd7E+7gF4WgMqgEELscymAbD7W676a2PMH3npLIX70BYZ5Y7w7t0kfYC0syZTfi
	 sfVO+4b0ZMDjLX72zn62pdKq2KJYowFEbgiPb1VZOPcJZEhccJppZ6DTgHav3T9XcF
	 +aprXx2aJMHmg==
Date: Sat, 19 Oct 2024 05:32:52 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: magnus.damm@gmail.com, linux-kernel@vger.kernel.org, 
 p.zabel@pengutronix.de, mturquette@baylibre.com, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, alexandre.belloni@bootlin.com, 
 linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, sboyd@kernel.org, 
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
 linux-renesas-soc@vger.kernel.org, geert+renesas@glider.be, 
 krzk+dt@kernel.org, conor+dt@kernel.org
In-Reply-To: <20241019084738.3370489-7-claudiu.beznea.uj@bp.renesas.com>
References: <20241019084738.3370489-1-claudiu.beznea.uj@bp.renesas.com>
 <20241019084738.3370489-7-claudiu.beznea.uj@bp.renesas.com>
Message-Id: <172933397224.3030070.17299337634844003264.robh@kernel.org>
Subject: Re: [PATCH v4 06/12] dt-bindings: rtc: renesas,rzg3s-rtc: Document
 the Renesas RTCA-3 IP


On Sat, 19 Oct 2024 11:47:32 +0300, Claudiu wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> Document the RTC IP (RTCA-3) available on the Renesas RZ/G3S SoC.
> The RTC IP available on Renesas RZ/V2H is almost identical with the
> one found on Renesas RZ/G3S (it misses the time capture functionality
> which is not yet implemented on proposed driver). For this, added also a
> generic compatible that will be used at the moment as fallback for both
> RZ/G3S and RZ/V2H.
> 
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
> 
> Changes in v4:
> - collected tags
> - dropped the assigned-clocks, assigned-clock-parents properties from the
>   example, along with r9a08g045-vbattb.h inclusion; these were moved
>   to the VBATTB example as it fits better in there since these are
>   related to the VBATTB but not to the RTC;
> 
>   Rob, I haven't dropped your Rb tag for this; please let me know if you
>   consider it otherwise.
> 
> Changes in v3:
> - added RTC bus clock, reset and power-domain; it has been detected
>   by reverse engineering that RTC and VBATTB clock, reset and power
>   domain are shared; HW manual doesn't mention it
> - updated example with these and with assigned-clock properties
>   needed to configure the VBATTCLK MUX with proper parent
> - updated example section with dt-bindings/clock/r9a08g045-cpg.h
>   and dt-bindings/clock/r9a08g045-vbattb.h includes
> - for all these, dropped Conor's Rb tag
> 
> Changes in v2:
> - updated patch description and title
> - included reference to rtc.yaml
> - updated compatible list with a generic compatible as explained in
>   patch description; with this the node in examples section has also been
>   updated
> - used items to describe interrupts, interrupt-names, clock, clock-names
> - updated title section
> 
>  .../bindings/rtc/renesas,rz-rtca3.yaml        | 83 +++++++++++++++++++
>  1 file changed, 83 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/rtc/renesas,rz-rtca3.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Error: Documentation/devicetree/bindings/rtc/renesas,rz-rtca3.example.dts:35.47-48 syntax error
FATAL ERROR: Unable to parse input tree
make[2]: *** [scripts/Makefile.dtbs:129: Documentation/devicetree/bindings/rtc/renesas,rz-rtca3.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1442: dt_binding_check] Error 2
make: *** [Makefile:224: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241019084738.3370489-7-claudiu.beznea.uj@bp.renesas.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


