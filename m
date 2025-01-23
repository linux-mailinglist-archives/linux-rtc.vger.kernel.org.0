Return-Path: <linux-rtc+bounces-3025-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3045AA1A34A
	for <lists+linux-rtc@lfdr.de>; Thu, 23 Jan 2025 12:42:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EE2601881EFE
	for <lists+linux-rtc@lfdr.de>; Thu, 23 Jan 2025 11:42:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D426E215798;
	Thu, 23 Jan 2025 11:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J73Lrn6s"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4C34215786;
	Thu, 23 Jan 2025 11:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737632352; cv=none; b=QnCbWlWVDQ8jljG9QYc2XPQ0RavI6svPnxMM5H+NffZvmmx4U1zT2BYY+zIOBLhJ0dUNeaM8fgO15IPKSGfY7s0p5wJSEAkT3lR0vHq0VN/kYkILPnomIcIrzXdBAX02/+WDy4Lz1z8SMHnx5ossp1C08ez292D6Ya9WCC3THrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737632352; c=relaxed/simple;
	bh=B9YQbPf3Aney4L/BwO4hzMNTk/gCvSRwKxwEWoRFhwQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FoiF016tjTn6pVsibSpNYMZg182hCbSn/RuklK7Q0oHzMYRqrJo97dTK55FsDtGR5rkZG7egK5rF2aD7ZEEOefj8H6TQFeCVIgDvydy2iVwyavCIyNQPf6fYPAdUzihk0O14ifOizggJyZjy5DyH8W0X5TVX/rcSHOsmniValaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J73Lrn6s; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C92DC4CED3;
	Thu, 23 Jan 2025 11:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737632352;
	bh=B9YQbPf3Aney4L/BwO4hzMNTk/gCvSRwKxwEWoRFhwQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J73Lrn6sNhagrrmaH3k1zv1gjH6PtTI4zgAmn7DJBAIiFEhq5wPQp1kYclkKGkzyX
	 4ULhXXzRxhlWBej0wQiCt5l0BfuZpN8ohPJrUoABOB2CvwB56SCQziZhGygQe1vvR8
	 Oa7300bSXR0KCH6x0K5CsLdUBbeljOXobbtfwHbv5UVPYwYyjrRX6+//8uUNHeeeg3
	 YoY/st8dOdw0rXGMrQVMt+dtklxMJhWBB7eIRFzzguxk+f4h5wJOW6qHGXMybjFYvJ
	 ZDvnKQSsC3+J/v/se1vWI66QBmiGY23ryacZ9hPhlpB9pJ9H2Jgrr6te1wLsBeywaG
	 O+ZVw6DuoaugA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tavYL-000000002Ut-1JOu;
	Thu, 23 Jan 2025 12:39:18 +0100
Date: Thu, 23 Jan 2025 12:39:17 +0100
From: Johan Hovold <johan@kernel.org>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org,
	linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/7] rtc: pm8xxx: mitigate flash wear
Message-ID: <Z5IqZcRbd1vkyp-Z@hovoldconsulting.com>
References: <20250120144152.11949-1-johan+linaro@kernel.org>
 <20250120144152.11949-5-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250120144152.11949-5-johan+linaro@kernel.org>

On Mon, Jan 20, 2025 at 03:41:49PM +0100, Johan Hovold wrote:
> On many Qualcomm platforms the PMIC RTC control and time registers are
> read-only so that the RTC time can not be updated. Instead an offset
> needs be stored in some machine-specific non-volatile memory, which the
> driver can take into account.
> 
> On machines like the Lenovo ThinkPad X14s the PMIC RTC drifts about one

s/X14s/X13s/

> second every 3.5 hours, something which leads to repeated updates of the
> offset when NTP synchronisation is enabled.
> 
> Reduce wear of the underlying flash storage (used for UEFI variables) by
> deferring writes until shutdown in case they appear to be due to clock
> drift.
> 
> As an example, allowing the on-flash offset to differ up to 30 s reduces

And this was supposed to say:

	As an example, deferring writes when the new offset differs up
	to 30 s from the previous one reduces
	
> the number of writes on the X13s during a ten day session with the
> machine not suspending for more than four days in a row from up to 68
> writes (every 3.5 h) to at most two (boot and shutdown).

Johan

