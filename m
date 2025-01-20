Return-Path: <linux-rtc+bounces-2965-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AFBBA17113
	for <lists+linux-rtc@lfdr.de>; Mon, 20 Jan 2025 18:13:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4BBAB1881C63
	for <lists+linux-rtc@lfdr.de>; Mon, 20 Jan 2025 17:13:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEDD01EC019;
	Mon, 20 Jan 2025 17:13:51 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A407E1EC00F;
	Mon, 20 Jan 2025 17:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737393231; cv=none; b=G/9IZU7e50WjdMOmZ/74nLIwchW7LeCwYLZdalNPC/HbagMg6V7wEbpAsG+7O+J/nojAcU7muGWZZmx8Dm+VI6sKNC7Zvz8k0sDiesWAIlyJq65Lrsb03D6R9fYv4wNDZj3dD8qANO6quc3qzJUzJsaY0hJBQ4USq6qBLu3bwq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737393231; c=relaxed/simple;
	bh=zF1T/Fi2X+2lOzUdK1cX6gQOJFV2B1ipXaqZUgarv4c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PwmZtvonr4Cm7PvRdi5vAgywVQ6gDFnGD/sCvlRlOeSbVhSFvAs/aUhYtT/z5QBXh0TW5rLBnLaOjDIGTpSvRQEpELHU9S2vzwakFyLU3/xXuUFwZCGtNSH3yqe/1ZLqlB4nk0vSGlmcgdt/PLUUVmuQdiWLN2+ZSyDgpMofHT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 73ABC339;
	Mon, 20 Jan 2025 09:14:17 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AA0BB3F740;
	Mon, 20 Jan 2025 09:13:46 -0800 (PST)
Date: Mon, 20 Jan 2025 17:13:43 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Johan Hovold <johan@kernel.org>
Cc: Johan Hovold <johan+linaro@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org,
	linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/7] rtc: pm8xxx: add support for uefi offset
Message-ID: <Z46ERygUaUxZEHuX@bogus>
References: <20250120144152.11949-1-johan+linaro@kernel.org>
 <20250120144152.11949-4-johan+linaro@kernel.org>
 <Z45nYEfq2IPsrRy7@bogus>
 <Z45oqqnlMSNEYyil@hovoldconsulting.com>
 <Z45pEEofHiQRkR0D@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z45pEEofHiQRkR0D@hovoldconsulting.com>

On Mon, Jan 20, 2025 at 04:17:36PM +0100, Johan Hovold wrote:
> On Mon, Jan 20, 2025 at 04:15:54PM +0100, Johan Hovold wrote:
> > On Mon, Jan 20, 2025 at 03:10:24PM +0000, Sudeep Holla wrote:
> > > On Mon, Jan 20, 2025 at 03:41:48PM +0100, Johan Hovold wrote:
> > > > On many Qualcomm platforms the PMIC RTC control and time registers are
> > > > read-only so that the RTC time can not be updated. Instead an offset
> > > > needs be stored in some machine-specific non-volatile memory, which the
> > > > driver can take into account.
> > > > 
> > > > Add support for storing a 32-bit offset from the GPS time epoch in a
> > > > UEFI variable so that the RTC time can be set on such platforms.
> > > >
> > > 
> > > Why can't the UEFI runtime services be used here ?
> > > In short, why is drivers/rtc/rtc-efi.c not working or no attempts are
> > > made to check if that works just fine ?
> > 
> > As I alluded to in the commit message, the Qualcomm UEFI implementation
> 
> s/commit message/cover letter/
>

Ah OK, Sorry for missing that and for you dealing with this mess 😄.
Never ending or very long list of quirks on Linux for the platform I imagine.

--
Regards,
Sudeep

