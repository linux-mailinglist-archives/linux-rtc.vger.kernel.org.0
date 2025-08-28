Return-Path: <linux-rtc+bounces-4784-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D0F0FB3AD50
	for <lists+linux-rtc@lfdr.de>; Fri, 29 Aug 2025 00:12:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BFF431696EA
	for <lists+linux-rtc@lfdr.de>; Thu, 28 Aug 2025 22:12:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF2EB2C374B;
	Thu, 28 Aug 2025 22:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="TfM05Iot"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7849E281520;
	Thu, 28 Aug 2025 22:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756419161; cv=none; b=Qn9YZ1Jx/MYvrXFn0iTaqlhtAvdfwimpyRX+gVv8aikSzKXxay7ayfK8InZnx8/4srHYaxTkTo5TjzHc0Ye9mBO/1tOjy3tS7OkxroMR58M29vDRGBgiEQmITdAT+O55YT9bpMOMB/R5it06b31h2J6eshMAFpzIdXGyP0OHbgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756419161; c=relaxed/simple;
	bh=1NIhAK+w11BGCjslpOtTVWdmmqJ+P6N6h23+i81JK14=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y8baAQe2dh4TXOir3RH9DWQ3oGs2cH998XgZQ7VBj9xbEawUqc7Y8DorZC24tzR/ZCBklGMtR1d9jJNFuFbe80f0g+fjfd0tKnghv3za3rwco/U6a7TX0hcsAMs97HzvfnJp3oJOMwuWkZMrOnuL5Pu0blzbolpeFTuFPaof8iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=TfM05Iot; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 930041A095A;
	Thu, 28 Aug 2025 22:12:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5248C60303;
	Thu, 28 Aug 2025 22:12:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AF0B91C2282D4;
	Fri, 29 Aug 2025 00:12:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1756419154; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=umk9iWJI80083siMMEl+CA2tkGjcz41y3WD2Fn8H0Ic=;
	b=TfM05Iot5cnVPUd+7CT5hHAFGGdx3Wi+hnTehL7TC1loZXNHtBwRJB1bDydItFHFCUjds4
	6XdfgO5G5hisGu3ehZz/a0X/jv6btLjl4hQiaoLkfRPtbv0cBka3LnqI4LFCE8J1qGG6P1
	0v+rZPq6GDA//du7YZ9+PRivJXiUBE99st4zy5u9pClr4rAqfSSZhYZcMknbpXlnLCD38N
	jf4uNvQVAxaVGp1HHHXmC2oijgL8+ivkSlEzAviwt3odii7Je/6SGLCtBVtCJQcI1vLEoB
	I9SAK4aG+XE+lvktkk8TNNXTcLEP2LYZXkIcQek3zI+1VYG7tAi7Wo3D6KThxA==
Date: Fri, 29 Aug 2025 00:12:13 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: James Calligeros <jcalligeros99@gmail.com>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>, Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-input@vger.kernel.org,
	Mark Kettenis <kettenis@openbsd.org>,
	Hector Martin <marcan@marcan.st>
Subject: Re: [PATCH v2 00/11] mfd: macsmc: add rtc, hwmon and hid subdevices
Message-ID: <202508282212139a74f113@mail.local>
References: <20250827-macsmc-subdevs-v2-0-ce5e99d54c28@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250827-macsmc-subdevs-v2-0-ce5e99d54c28@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3

Hello,

On 27/08/2025 21:22:34+1000, James Calligeros wrote:
> Hi all,
> 
> This series adds support for the remaining SMC subdevices. These are the
> RTC, hwmon, and HID devices. They are being submitted together as the RTC
> and hwmon drivers both require changes to the SMC DT schema.
> 

How do you expect this to be merged? From what I get, I could just take
1 and 3 as there doesn't seem to be any actual dependencies on any of
the other patches and the MFD change doesn't depend on the RTC changes.

> The RTC driver is responsible for getting and setting the system clock,
> and requires an NVMEM cell. This series replaces Sven's original RTC driver
> submission [1].
> 
> The hwmon function is an interesting one. While each Apple Silicon device
> exposes pretty similar sets of sensors, these all seem to be paired to
> different SMC keys in the firmware interface. This is true even when the
> sensors are on the SoC. For example, an M1 MacBook Pro will use different
> keys to access the LITTLE core temperature sensors to an M1 Mac mini. This
> necessitates describing which keys correspond to which sensors for each
> device individually, and populating the hwmon structs at runtime. We do
> this with a node in the device tree. This series includes only the keys
> for sensors which we know to be common to all devices. The SMC is also
> responsible for monitoring and controlling fan speeds on systems with fans,
> which we expose via the hwmon driver.
> 
> The SMC also handles the hardware power button and lid switch. Power
> button presses and lid opening/closing are emitted as HID events, so we
> add a HID subdevice to handle them.
> 
> Note that this series is based on a branch with three additional commits
> applied to add the parent SMC nodes to the relevant Devicetrees. This
> was done to silence build errors. The series applies cleanly to 6.17-rc1.
> 
> Regards,
> 
> James
> 
> [1] https://lore.kernel.org/asahi/CAEg-Je84XxLWH7vznQmPRfjf6GxWOu75ZetwN7AdseAwfMLLrQ@mail.gmail.com/T/#t
> 
> Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
> ---
> Changes in v2:
> - Added Rob's R-b tag to RTC DT binding
> - Removed redundant nesting from hwmon DT binding
> - Dedpulicated property definitions in hwmon DT schema
> - Made label a required property for hwmon DT nodes
> - Clarified semantics in hwmon DT schema definitions
> - Split mfd tree changes into separate commits
> - Fixed numerous style errors in hwmon driver
> - Addressed Guenter's initial feedback on the hwmon driver
> - Modified hwmon driver to reflect DT schema changes
> - Added compatible property to hwmon node
> - Link to v1: https://lore.kernel.org/r/20250819-macsmc-subdevs-v1-0-57df6c3e5f19@gmail.com
> 
> ---
> Hector Martin (2):
>       rtc: Add new rtc-macsmc driver for Apple Silicon Macs
>       input: macsmc-hid: New driver to handle the Apple Mac SMC buttons/lid
> 
> James Calligeros (7):
>       dt-bindings: hwmon: Add Apple System Management Controller hwmon schema
>       mfd: macsmc: Wire up Apple SMC RTC subdevice
>       hwmon: Add Apple Silicon SMC hwmon driver
>       mfd: macsmc: Wire up Apple SMC hwmon subdevice
>       mfd: macsmc: Wire up Apple SMC HID subdevice
>       arm64: dts: apple: Add common hwmon sensors and fans
>       arm64: dts: apple: t8103, t600x, t8112: Add common hwmon nodes to devices
> 
> Sven Peter (2):
>       dt-bindings: rtc: Add Apple SMC RTC
>       arm64: dts: apple: t8103,t600x,t8112: Add SMC RTC node
> 
>  .../bindings/hwmon/apple,smc-hwmon.yaml  | 132 ++++
>  .../bindings/mfd/apple,smc.yaml          |  45 ++
>  .../bindings/rtc/apple,smc-rtc.yaml      |  35 +
>  MAINTAINERS                              |   5 +
>  .../boot/dts/apple/hwmon-common.dtsi     |  37 ++
>  .../boot/dts/apple/hwmon-fan-dual.dtsi   |  24 +
>  arch/arm64/boot/dts/apple/hwmon-fan.dtsi |  19 +
>  .../boot/dts/apple/hwmon-laptop.dtsi     |  35 +
>  .../boot/dts/apple/hwmon-mac-mini.dtsi   |  17 +
>  .../arm64/boot/dts/apple/t6001-j375c.dts |   2 +
>  .../arm64/boot/dts/apple/t6002-j375d.dts |   2 +
>  .../arm64/boot/dts/apple/t600x-die0.dtsi |   6 +
>  .../boot/dts/apple/t600x-j314-j316.dtsi  |   4 +
>  .../arm64/boot/dts/apple/t600x-j375.dtsi |   2 +
>  arch/arm64/boot/dts/apple/t8103-j274.dts |   2 +
>  arch/arm64/boot/dts/apple/t8103-j293.dts |   3 +
>  arch/arm64/boot/dts/apple/t8103-j313.dts |   2 +
>  arch/arm64/boot/dts/apple/t8103-j456.dts |   2 +
>  arch/arm64/boot/dts/apple/t8103-j457.dts |   2 +
>  .../arm64/boot/dts/apple/t8103-jxxx.dtsi |   2 +
>  arch/arm64/boot/dts/apple/t8103.dtsi     |   6 +
>  arch/arm64/boot/dts/apple/t8112-j413.dts |   2 +
>  arch/arm64/boot/dts/apple/t8112-j473.dts |   2 +
>  arch/arm64/boot/dts/apple/t8112-j493.dts |   3 +
>  .../arm64/boot/dts/apple/t8112-jxxx.dtsi |   2 +
>  arch/arm64/boot/dts/apple/t8112.dtsi     |   6 +
>  drivers/hwmon/Kconfig                    |  12 +
>  drivers/hwmon/Makefile                   |   1 +
>  drivers/hwmon/macsmc_hwmon.c             | 848 +++++++++++++++++++++++++
>  drivers/input/misc/Kconfig               |  11 +
>  drivers/input/misc/Makefile              |   1 +
>  drivers/input/misc/macsmc-hid.c          | 209 ++++++
>  drivers/mfd/macsmc.c                     |   3 +
>  drivers/rtc/Kconfig                      |  11 +
>  drivers/rtc/Makefile                     |   1 +
>  drivers/rtc/rtc-macsmc.c                 | 141 ++++
>  36 files changed, 1637 insertions(+)
> ---
> base-commit: 876d6a70b24869f96ebc8672caf86cb4bae72927
> change-id: 20250816-macsmc-subdevs-87032c017d0c
> 
> Best regards,
> -- 
> James Calligeros <jcalligeros99@gmail.com>
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

