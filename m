Return-Path: <linux-rtc+bounces-4651-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69904B1E934
	for <lists+linux-rtc@lfdr.de>; Fri,  8 Aug 2025 15:29:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 452A67A484F
	for <lists+linux-rtc@lfdr.de>; Fri,  8 Aug 2025 13:27:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C948D27E7F9;
	Fri,  8 Aug 2025 13:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mMBYOG7y"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9967927E7DA;
	Fri,  8 Aug 2025 13:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754659743; cv=none; b=P+tn14Eztl6cziBiZzkwRr2UlCAlgo2ymgVaZhdsOCv98FAyje41eTU/a0tIbxznvXXSmFFK5IDLCSoRlYNQy2OTAncoWvvxoD8ggL0VNiJ5ddwrMl7FWbEJQ2Qzs3IZSY6D+SCGbeSsIhK4I7zAi7QEslgjHhO/YuV3CnrrH/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754659743; c=relaxed/simple;
	bh=8CxkePBoinJZHM6eafRoAqHyeCvQwc8LOe1miJnU4ZA=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=PWou7S3u50gAWC4rQbUNnevgljuT1PONUmvWaFgXVQbNqy7PVL3WO0SV8Irw6dWoo3q4wDKdXhpsfdvXjiG0m4Hp5apOWNhSjC2L/8UwbnsF+VKBpBqyphSbr8fRjZUFQSVsxz+Hy2Zph/d6pBDgMkY5uVw+y8FLi/E5U/OH2AM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mMBYOG7y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04AABC4CEF4;
	Fri,  8 Aug 2025 13:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754659743;
	bh=8CxkePBoinJZHM6eafRoAqHyeCvQwc8LOe1miJnU4ZA=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=mMBYOG7ysl3E1Ue8yjMtsduUbV/pdEEIrKJHRwXY7xVhyzmMUHq26BfYB48bwZpJb
	 W6Qwbba0lEzM1J+QrCIBhxATNkZ0I5wOMiXK4yrzRraxPP3/4zGwuyWvyKEvTzGJ+f
	 8lCMNgSbIw6qPa26Ymj0h6QvpNbsaCX3lHa937LXnL+2ryyFt8vCgMM7Tm+widxoKt
	 2gz7LhPsvf9eGxFQS0oo5c/T801e4BZATBHmSU1r+L/EiEEpoNLykx5gutOscGSC7x
	 DuLZwOE8eQe7sgRM6YJGTvJr0XKqaUkkakivAMmxCH6PlLSyVj9budTd8B9cejSaQ1
	 RJs+CohbhRsMg==
Date: Fri, 08 Aug 2025 08:29:02 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, alexandre.belloni@bootlin.com, 
 priyanka.jain@nxp.com, krzk+dt@kernel.org, shashank.rebbapragada@nxp.com, 
 conor+dt@kernel.org, linux-rtc@vger.kernel.org, vikash.bansal@nxp.com, 
 linux-kernel@vger.kernel.org
To: Lakshay Piplani <lakshay.piplani@nxp.com>
In-Reply-To: <20250808112246.4169280-1-lakshay.piplani@nxp.com>
References: <20250808112246.4169280-1-lakshay.piplani@nxp.com>
Message-Id: <175465973963.5932.7440128759454055701.robh@kernel.org>
Subject: Re: [PATCH 1/2] rtc: pcf85363: add support for timestamp and
 watchdog


On Fri, 08 Aug 2025 16:52:45 +0530, Lakshay Piplani wrote:
> Extend the device tree binding for NXP PCF85263/PCF85363 RTC with:
> - Timestamp mode configuration
> - Watchdog timer configuration
> 
> Also introduce a new header 'pcf85363-tsr.h' to expose
> macros for timestamp mode fields, improving readability
> of device tree file.
> 
> Signed-off-by: Lakshay Piplani <lakshay.piplani@nxp.com>
> ---
>  .../devicetree/bindings/rtc/nxp,pcf85363.yaml | 44 ++++++++++++++++++-
>  include/dt-bindings/rtc/pcf85363-tsr.h        | 28 ++++++++++++
>  2 files changed, 71 insertions(+), 1 deletion(-)
>  create mode 100644 include/dt-bindings/rtc/pcf85363-tsr.h
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/rtc/nxp,pcf85363.yaml: nxp,timestamp-mode: missing type definition

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250808112246.4169280-1-lakshay.piplani@nxp.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


