Return-Path: <linux-rtc+bounces-5490-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D8D1C8E628
	for <lists+linux-rtc@lfdr.de>; Thu, 27 Nov 2025 14:15:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 08CAA34C399
	for <lists+linux-rtc@lfdr.de>; Thu, 27 Nov 2025 13:15:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 188591E00B4;
	Thu, 27 Nov 2025 13:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="idiZWJ4i"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC81229A1;
	Thu, 27 Nov 2025 13:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764249314; cv=none; b=VS18qO4fgnWAD7oQ7pr5rCg7OWwqPHB+T9+Gw/QvRsU/65nFD66deG4O2FYf9NVCDO40e1hBdfhZ+sQ6vWkJHc6M6xftJ4RWjK1Tw+4GMJ0vzA/pekNmgPn111VlK7nfJNE6OUznRoHJj8+JJUzSmYUPZqbsda8cPo69WC1azNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764249314; c=relaxed/simple;
	bh=/pYQe+AEElC8pJ6wJmKYGTTUlDA7qrt2HtbBAmtPy6o=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=cuWZPRJnMy7UL1P4vU//xGD5I3fYB3su9gz4r6/rqGZHpSu8oJNYlEc5grLPVL6R6GKVxT63Oc+HE08LCJpQLIEzMt487rC8CcJiMPV6LmJzQli0d7jI8dJTbRGW2+QVQNxevEUD+sSHF8addv0nHnJWPYa1yVupComik/VZ0AU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=idiZWJ4i; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CCDDC4CEF8;
	Thu, 27 Nov 2025 13:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764249313;
	bh=/pYQe+AEElC8pJ6wJmKYGTTUlDA7qrt2HtbBAmtPy6o=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=idiZWJ4iIIgAFunFsVENkhIQ2qqFGL4Ohv+cpgFVbK8HK0h13B9x9JS/pIxsBWkxb
	 H93QbN4XT20IlBlap2l9NMxL2pO1bmJ0CLhF7nMUogojkJcKR1Bna+B8VK/iclmCBW
	 3uMRh5Atw8ku2p6XxjIbRalEgH/AuyIp+ajpYVJ7clgNdUZTi9TkXDUFVqiv/D586U
	 4JwWIo4xKY6Bi2dNNzYqIoydcXhitwE43FvSD55gKnWSVywF74HfZzaTerTKrA63rY
	 3/S8kHWh4Girklc55LQ9Wh8BRS1EiRGq9ACnX5tYbzsmyuwvPyGriynr2/3n5Hj/Dy
	 ii0vZJHcnG7Bw==
Date: Thu, 27 Nov 2025 07:15:11 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-rtc@vger.kernel.org, priyanka.jain@nxp.com, 
 Conor Dooley <conor.dooley@microchip.com>, vikash.bansal@nxp.com, 
 krzk+dt@kernel.org, shashank.rebbapragada@nxp.com, 
 Pankit Garg <pankit.garg@nxp.com>, linux-kernel@vger.kernel.org, 
 conor+dt@kernel.org, alexandre.belloni@bootlin.com, 
 devicetree@vger.kernel.org
To: Lakshay Piplani <lakshay.piplani@nxp.com>
In-Reply-To: <20251127120456.1849177-1-lakshay.piplani@nxp.com>
References: <20251127120456.1849177-1-lakshay.piplani@nxp.com>
Message-Id: <176424931148.3999997.8332932232270023828.robh@kernel.org>
Subject: Re: [PATCH v7 1/2] dt-bindings: rtc: Add pcf85053 support


On Thu, 27 Nov 2025 17:34:55 +0530, Lakshay Piplani wrote:
> Add device tree bindings for NXP PCF85053 RTC chip.
> 
> Signed-off-by: Pankit Garg <pankit.garg@nxp.com>
> Signed-off-by: Lakshay Piplani <lakshay.piplani@nxp.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> V6 -> V7: - no changes
> 	  - Added Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> V5 -> V6: - Dropped driver-specific commentary from property descriptions.
> 	  - Simplified and clarified descriptions for better readability.
> V4 -> V5: - Updated schema validation logic to enforce correct combinations of
>             'nxp,interface' and 'nxp,write-access' using oneOf clauses.
>           - Refined property descriptions for clarity and hardware alignment.
> V3 -> V4: Add dedicated nxp,pcf85053.yaml.
>           Remove entry from trivial-rtc.yaml.
> V2 -> V3: Moved MAINTAINERS file changes to the driver patch
> V1 -> V2: Handled dt-bindings by trivial-rtc.yaml
> 
>  .../devicetree/bindings/rtc/nxp,pcf85053.yaml | 114 ++++++++++++++++++
>  1 file changed, 114 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/rtc/nxp,pcf85053.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/thermal/thermal-zones.example.dtb: /example-0/soc/thermal-sensor@c263000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
Documentation/devicetree/bindings/thermal/thermal-zones.example.dtb: /example-0/soc/thermal-sensor@c263000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
Documentation/devicetree/bindings/thermal/thermal-zones.example.dtb: /example-0/soc/thermal-sensor@c265000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
Documentation/devicetree/bindings/thermal/thermal-zones.example.dtb: /example-0/soc/thermal-sensor@c265000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
Documentation/devicetree/bindings/thermal/thermal-sensor.example.dtb: /example-0/soc/thermal-sensor@c263000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
Documentation/devicetree/bindings/thermal/thermal-sensor.example.dtb: /example-0/soc/thermal-sensor@c263000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
Documentation/devicetree/bindings/thermal/thermal-sensor.example.dtb: /example-0/soc/thermal-sensor@c265000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
Documentation/devicetree/bindings/thermal/thermal-sensor.example.dtb: /example-0/soc/thermal-sensor@c265000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20251127120456.1849177-1-lakshay.piplani@nxp.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


