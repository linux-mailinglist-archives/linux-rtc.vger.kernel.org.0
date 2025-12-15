Return-Path: <linux-rtc+bounces-5547-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 69DEECBD61A
	for <lists+linux-rtc@lfdr.de>; Mon, 15 Dec 2025 11:37:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 127C43012BDA
	for <lists+linux-rtc@lfdr.de>; Mon, 15 Dec 2025 10:36:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5C503164C8;
	Mon, 15 Dec 2025 10:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ULVZ/usP"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94A232882C5;
	Mon, 15 Dec 2025 10:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765794989; cv=none; b=eJLXbhqoXmIRIN2+PSwJG2jdtm7BPSFgaxDWWBRslN74PLnV1UEcu1ifxgV6PnoyFgGFJV7V/VfW8+gHn8ry4m06sLzfZC4veh4O/sdAuN6YpFzlmrvx2Trwc9XkGQY4vfBciHaa8C6fBoL2wzV+gexNduEeY+0sZa5GbEr/qEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765794989; c=relaxed/simple;
	bh=VnZ9AI+OcSYjRRCKYpKhQNADkzDfaUzJNzcsasS8Vos=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=heMDI9xb77UFtxkdb3R6rfd/nZlnyXI243hUtGSueVFzhcYhf7eITP/F3B1pzJW3pQ5PvJpuOc/eJfqac7N9vO8DDM4M7/fOwzR/itPqK9rxkhsdXyvddirFUcXEy95yJwRxHF2eqEvYyTMLHMC2xgyW4dpM5NRTSUsvntO3e0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ULVZ/usP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A4F1C4CEF5;
	Mon, 15 Dec 2025 10:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765794989;
	bh=VnZ9AI+OcSYjRRCKYpKhQNADkzDfaUzJNzcsasS8Vos=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=ULVZ/usPznXq3DhQThXZBO4aMJjHoKA+pwX75G7MAXzBw0Wn1zC2vrBwOvcFA41xC
	 ULin4X7tqnkgmW26HZnJ3w0CgFKGu1o842V2AKsmaCVLYtjRr8deodkKtvtpbLAB1l
	 BEPLvuLrRahuZ8yZ4hhFQJOueLxi+TpJys7JJD1MzdspYT/rdSbN/T7Hm8dPlfWAUc
	 7uiTH4lWg2NjaobkqgPiCeIXHfXmqCW+JXsiareBFSVyW/48VNkWqhb5YB0qL1QL/H
	 Mq5xrxiRn9uudLeKLrKnWbi4tz7L+Tpcplc9ihm39Uuu8R93Hk4JoreYdKqSS22u5/
	 8gzm6RHv/C0/Q==
Date: Mon, 15 Dec 2025 04:36:26 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, Sven Peter <sven@kernel.org>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, asahi@lists.linux.dev, 
 Lee Jones <lee@kernel.org>, linux-input@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jean Delvare <jdelvare@suse.com>, 
 linux-arm-kernel@lists.infradead.org, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Guenter Roeck <linux@roeck-us.net>, linux-rtc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org, 
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
To: James Calligeros <jcalligeros99@gmail.com>
In-Reply-To: <20251215-macsmc-subdevs-v6-1-0518cb5f28ae@gmail.com>
References: <20251215-macsmc-subdevs-v6-0-0518cb5f28ae@gmail.com>
 <20251215-macsmc-subdevs-v6-1-0518cb5f28ae@gmail.com>
Message-Id: <176579498664.1749225.5193965875803198793.robh@kernel.org>
Subject: Re: [PATCH v6 1/7] dt-bindings: hwmon: Add Apple System Management
 Controller hwmon schema


On Mon, 15 Dec 2025 19:37:45 +1000, James Calligeros wrote:
> Apple Silicon devices integrate a vast array of sensors, monitoring
> current, power, temperature, and voltage across almost every part of
> the system. The sensors themselves are all connected to the System
> Management Controller (SMC). The SMC firmware exposes the data
> reported by these sensors via its standard FourCC-based key-value
> API. The SMC is also responsible for monitoring and controlling any
> fans connected to the system, exposing them in the same way.
> 
> For reasons known only to Apple, each device exposes its sensors with
> an almost totally unique set of keys. This is true even for devices
> which share an SoC. An M1 Mac mini, for example, will report its core
> temperatures on different keys to an M1 MacBook Pro. Worse still, the
> SMC does not provide a way to enumerate the available keys at runtime,
> nor do the keys follow any sort of reasonable or consistent naming
> rules that could be used to deduce their purpose. We must therefore
> know which keys are present on any given device, and which function
> they serve, ahead of time.
> 
> Add a schema so that we can describe the available sensors for a given
> Apple Silicon device in the Devicetree.
> 
> Reviewed-by: Neal Gompa <neal@gompa.dev>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
> ---
>  .../bindings/hwmon/apple,smc-hwmon.yaml  | 86 +++++++++++++++++++++++++
>  .../bindings/mfd/apple,smc.yaml          | 36 +++++++++++
>  MAINTAINERS                              |  1 +
>  3 files changed, 123 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/hwmon/apple,smc-hwmon.yaml:73:1: [warning] too many blank lines (2 > 1) (empty-lines)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20251215-macsmc-subdevs-v6-1-0518cb5f28ae@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


