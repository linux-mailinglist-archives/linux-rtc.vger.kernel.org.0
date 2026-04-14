Return-Path: <linux-rtc+bounces-6331-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KOouGZ333WlolgkAu9opvQ
	(envelope-from <linux-rtc+bounces-6331-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Tue, 14 Apr 2026 10:15:25 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C20D93F70C2
	for <lists+linux-rtc@lfdr.de>; Tue, 14 Apr 2026 10:15:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1FB3C3007E39
	for <lists+linux-rtc@lfdr.de>; Tue, 14 Apr 2026 07:58:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E038387569;
	Tue, 14 Apr 2026 07:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s8RdcM1Q"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6758B382F00;
	Tue, 14 Apr 2026 07:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776153511; cv=none; b=bm0DMX2ZK2U4OwcoiXJQnzndSiFCKnyQZLTKvJrdVB+N4k7O/6DVMHJMcaP2Ww3GsKJjMDdjPqB6zObOuMfqDYQgAvg/RYriPIInJQ8s5KdkvixxhFLuiTIP73rLQj0ebowbW8Dldl4ow36oa4Ss6oqymUvVMuis5a/Aw/pUh44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776153511; c=relaxed/simple;
	bh=GnyG5msXBP+YBGkuMAE1tNpBGQFgvLOi3k5F4gox66Q=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=U+97VmpOS19LMGZMXqTcpMric9yonWDsS3cdTPEdn/3rEhTYWp5r8no6DpJK//CGe/mk8zPOefF4UBnkSAU1E+DTIpYfCjzVz1Du4IhG5Fpg2nel8lxFQE/SG5jwZqN7AjjJnmpMhzlbjJpgrScqWpy4/CguY4yLwhllK87vF5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s8RdcM1Q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D90D0C19425;
	Tue, 14 Apr 2026 07:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776153511;
	bh=GnyG5msXBP+YBGkuMAE1tNpBGQFgvLOi3k5F4gox66Q=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=s8RdcM1Qay/Tt56OSH//nhypfv5U4TNTCJVbLdqBGAKCJ6urGmxk02GAezvxUr8Rb
	 ZLCREz/03HdV9iidslkLRQZ1RF4LFlxcFdANPFaWVN2Cuq3nPthE5bemgHzFIhC2VX
	 ULnKmnvR7ILxa/G1rGfBxowLyfpJxN9lLj4taNPmDktFIXNUSTM/lLMN3cPFD23ZcC
	 N1eFLtrqINUhWcG0kZfqQ50hPulKskFiunX5ydZMTIaibFuJJsJOyFnAafxmItdJAN
	 7XIGeN25xVG+zpUziqje1TRQCpIVho1yDSGhoIu7zrpBrWEyCjr403WFpUKIQJi1KY
	 XlNQi1UKH0OiQ==
Date: Tue, 14 Apr 2026 02:58:29 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-rtc@vger.kernel.org, 
 linux-leds@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 Pavel Machek <pavel@kernel.org>, Nam Tran <trannamatk@gmail.com>, 
 linux-kernel@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>, 
 linux-doc@vger.kernel.org, MyungJoo Ham <myungjoo.ham@samsung.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 =?utf-8?q?=C5=81ukasz_Lebiedzi=C5=84ski?= <kernel@lvkasz.us>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Lee Jones <lee@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Sebastian Reichel <sre@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 linux-samsung-soc@vger.kernel.org
To: Kaustabh Chakraborty <kauschluss@disroot.org>
In-Reply-To: <20260414-s2mu005-pmic-v4-5-7fe7480577e6@disroot.org>
References: <20260414-s2mu005-pmic-v4-0-7fe7480577e6@disroot.org>
 <20260414-s2mu005-pmic-v4-5-7fe7480577e6@disroot.org>
Message-Id: <177615350902.422580.9843903543628073938.robh@kernel.org>
Subject: Re: [PATCH v4 05/13] dt-bindings: mfd: s2mps11: add documentation
 for S2MU005 PMIC
X-Spamd-Result: default: False [5.84 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	MAILLIST(-0.15)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,lwn.net,gmail.com,linuxfoundation.org,samsung.com,bootlin.com,lvkasz.us,linaro.org];
	TAGGED_FROM(0.00)[bounces-6331-lists,linux-rtc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	GREYLIST(0.00)[pass,body];
	RCPT_COUNT_TWELVE(0.00)[22];
	R_DKIM_ALLOW(0.00)[kernel.org:s=k20201202];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.1:email];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-rtc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	R_SPF_ALLOW(0.00)[+ip6:2600:3c0a:e001:db::/64:c];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	NEURAL_SPAM(0.00)[0.534];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.0.0.0:email,disroot.org:email,3d:email]
X-Rspamd-Queue-Id: C20D93F70C2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Tue, 14 Apr 2026 12:02:57 +0530, Kaustabh Chakraborty wrote:
> Samsung's S2MU005 PMIC includes subdevices for a charger, an MUIC (Micro
> USB Interface Controller), and flash and RGB LED controllers.
> 
> Since regulators are not supported by this device, unmark this property
> as required and instead set this in a per-device basis for ones which
> need it.
> 
> Add the compatible and documentation for the S2MU005 PMIC. Also, add an
> example for nodes for supported sub-devices, i.e. charger, extcon,
> flash, and rgb.
> 
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> ---
>  .../devicetree/bindings/mfd/samsung,s2mps11.yaml   | 121 ++++++++++++++++++++-
>  1 file changed, 120 insertions(+), 1 deletion(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/mfd/samsung,s2mps11.example.dts:241.29-39: Warning (reg_format): /example-2/i2c/pmic@3d/extcon/port/endpoint@0:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
Documentation/devicetree/bindings/mfd/samsung,s2mps11.example.dts:246.29-39: Warning (reg_format): /example-2/i2c/pmic@3d/extcon/port/endpoint@1:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
Documentation/devicetree/bindings/mfd/samsung,s2mps11.example.dtb: Warning (pci_device_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/mfd/samsung,s2mps11.example.dtb: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/mfd/samsung,s2mps11.example.dtb: Warning (simple_bus_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/mfd/samsung,s2mps11.example.dtb: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/mfd/samsung,s2mps11.example.dtb: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/mfd/samsung,s2mps11.example.dts:240.53-243.27: Warning (avoid_default_addr_size): /example-2/i2c/pmic@3d/extcon/port/endpoint@0: Relying on default #address-cells value
Documentation/devicetree/bindings/mfd/samsung,s2mps11.example.dts:240.53-243.27: Warning (avoid_default_addr_size): /example-2/i2c/pmic@3d/extcon/port/endpoint@0: Relying on default #size-cells value
Documentation/devicetree/bindings/mfd/samsung,s2mps11.example.dts:245.49-248.27: Warning (avoid_default_addr_size): /example-2/i2c/pmic@3d/extcon/port/endpoint@1: Relying on default #address-cells value
Documentation/devicetree/bindings/mfd/samsung,s2mps11.example.dts:245.49-248.27: Warning (avoid_default_addr_size): /example-2/i2c/pmic@3d/extcon/port/endpoint@1: Relying on default #size-cells value
Documentation/devicetree/bindings/mfd/samsung,s2mps11.example.dtb: Warning (unique_unit_address_if_enabled): Failed prerequisite 'avoid_default_addr_size'
Documentation/devicetree/bindings/mfd/samsung,s2mps11.example.dts:240.53-243.27: Warning (graph_endpoint): /example-2/i2c/pmic@3d/extcon/port/endpoint@0: graph node '#address-cells' is -1, must be 1
Documentation/devicetree/bindings/mfd/samsung,s2mps11.example.dts:240.53-243.27: Warning (graph_endpoint): /example-2/i2c/pmic@3d/extcon/port/endpoint@0: graph node '#size-cells' is -1, must be 0
Documentation/devicetree/bindings/mfd/samsung,s2mps11.example.dts:245.49-248.27: Warning (graph_endpoint): /example-2/i2c/pmic@3d/extcon/port/endpoint@1: graph node '#address-cells' is -1, must be 1
Documentation/devicetree/bindings/mfd/samsung,s2mps11.example.dts:245.49-248.27: Warning (graph_endpoint): /example-2/i2c/pmic@3d/extcon/port/endpoint@1: graph node '#size-cells' is -1, must be 0

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260414-s2mu005-pmic-v4-5-7fe7480577e6@disroot.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


