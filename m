Return-Path: <linux-rtc+bounces-2962-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D8C2A16F06
	for <lists+linux-rtc@lfdr.de>; Mon, 20 Jan 2025 16:10:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A5E631690F9
	for <lists+linux-rtc@lfdr.de>; Mon, 20 Jan 2025 15:10:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE38B1E5706;
	Mon, 20 Jan 2025 15:10:31 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44AE41B4F02;
	Mon, 20 Jan 2025 15:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737385831; cv=none; b=mxK9nNWR0GdCSk7/27aZj86XfStvmEL4KkPe5MswcgvYeGS79eBLSrV75zwWESq4liDKe7XOd4OovbMMk261YTVxE9WxcdtgLE9HDmeXPkxmmPMX4ZThVeNlbfG8SKCsqwylSvndQqb6AE1+qUIE0zG6LRQcZPx/Jr2E5mkGsLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737385831; c=relaxed/simple;
	bh=HpB/fIzVUcvaIsiu9s+bGtiYWWfrkvQsr8XXsYop6mY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Shii5m2/q1Z935o7wykg0p7pQwL5IiTqURuv1jt0VHb1QOWFUM05FCsqBIAPbJi44wyRJGo2jnZhAW/OBXUh3SJG3P6/RZOcO4ZTulpahAIPMrvaQWMWVRuF8h6qgeQ0h7PQts/vXKKnMusDOxyD3/xM+NT+ZYUU940j7ovD/Y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F28EB1063;
	Mon, 20 Jan 2025 07:10:57 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 59F7D3F740;
	Mon, 20 Jan 2025 07:10:27 -0800 (PST)
Date: Mon, 20 Jan 2025 15:10:24 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
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
Message-ID: <Z45nYEfq2IPsrRy7@bogus>
References: <20250120144152.11949-1-johan+linaro@kernel.org>
 <20250120144152.11949-4-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250120144152.11949-4-johan+linaro@kernel.org>

On Mon, Jan 20, 2025 at 03:41:48PM +0100, Johan Hovold wrote:
> On many Qualcomm platforms the PMIC RTC control and time registers are
> read-only so that the RTC time can not be updated. Instead an offset
> needs be stored in some machine-specific non-volatile memory, which the
> driver can take into account.
> 
> Add support for storing a 32-bit offset from the GPS time epoch in a
> UEFI variable so that the RTC time can be set on such platforms.
>

Why can't the UEFI runtime services be used here ?
In short, why is drivers/rtc/rtc-efi.c not working or no attempts are
made to check if that works just fine ?

-- 
Regards,
Sudeep

