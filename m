Return-Path: <linux-rtc+bounces-5281-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 43BECC3B79F
	for <lists+linux-rtc@lfdr.de>; Thu, 06 Nov 2025 14:56:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D746B188B538
	for <lists+linux-rtc@lfdr.de>; Thu,  6 Nov 2025 13:56:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29786333452;
	Thu,  6 Nov 2025 13:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IY8B4am+"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E52B5302179;
	Thu,  6 Nov 2025 13:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762437365; cv=none; b=nRhmwYxM7Ogcye5G1OeuujpDNTLsXTZp4cyvIw4LK/tg4df0ftpJn3bNHZ8uM7lUTlQaNfRx4Uo9MAR88xJ8gEkmkz7f8t4xW4pXCGKxOaaifPf9vR9rn1SM5amJxTC9wIrckGUwP2VOxd0hUYj0BLE+9OdJy/hWzGczn3aal8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762437365; c=relaxed/simple;
	bh=NDmfeyNji4d6yMNWtsY5RGMB0RhVGt7DeQaYrl2G384=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=suBBkgB82Y5GnEpyMBz1O4RGQ/u/vUYuYnRfDjleLDB156irCb8rz6hjq4ey7HsPfhOZT3JftLlK4sCaJDFInCN2zUbE22HBNtGue1QcO4pKbOsFJeHYJciW0HKwxroG7Rswrz95Vq45JSSQtXWVXLo59oXgwH7JB2BS6ZVnWoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IY8B4am+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14698C4CEF7;
	Thu,  6 Nov 2025 13:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762437363;
	bh=NDmfeyNji4d6yMNWtsY5RGMB0RhVGt7DeQaYrl2G384=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IY8B4am+n9NPjHPxZal5gV/UG3Re3bytgQq8hfMNy5qEzwKVHjCaOvI3JeKXmxK57
	 VTh/RqIonvmgwvwGprCRMzRuDec9Sq7FB8XbuGwZN32qe+6IMpZ1XsfLni2OWTjtDh
	 cBgfbf2WsN6SjwBN/SM3T+19kcjVoe0wpYM+o46dHDtQ106yLYGXw7UMIJ0MWQtKUq
	 cEzWr/SPp7enQrmwejVsCFA0vcSTZEt5cALgvUX8uAZ5xJgdsxIvXEuo5HanP10Usk
	 veWBTrqvT14esfPHuHmlLBjv+nBnUzqz4yTQS3hy3VCIoBtSDFNOlASCHNoWlBTwzU
	 HtcCNHpAQMANg==
Date: Thu, 6 Nov 2025 13:55:56 +0000
From: Lee Jones <lee@kernel.org>
To: James Calligeros <jcalligeros99@gmail.com>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-input@vger.kernel.org,
	linux-doc@vger.kernel.org, Mark Kettenis <kettenis@openbsd.org>,
	Hector Martin <marcan@marcan.st>
Subject: Re: [PATCH v4 00/11] mfd: macsmc: add rtc, hwmon and hid subdevices
Message-ID: <20251106135556.GP8064@google.com>
References: <20251025-macsmc-subdevs-v4-0-374d5c9eba0e@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251025-macsmc-subdevs-v4-0-374d5c9eba0e@gmail.com>

On Sat, 25 Oct 2025, James Calligeros wrote:

> Hi all,
> 
> This series adds support for the remaining SMC subdevices. These are the
> RTC, hwmon, and HID devices. They are being submitted together as the RTC
> and hwmon drivers both require changes to the SMC DT schema.
> 
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
> add an input subdevice to handle them.
> 
> Since there are no real dependencies between the components of this series,
> it should be fine for each subsystem to take the relevant patches through
> their trees. The mfd one-liners should be taken in order to avoid trivial
> conflicts.

The MFD parts look okay.  Let me know when the other drivers have been
accepted and I'll apply them all.

-- 
Lee Jones [李琼斯]

