Return-Path: <linux-rtc+bounces-5042-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B7A9DBB46C9
	for <lists+linux-rtc@lfdr.de>; Thu, 02 Oct 2025 17:59:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 404407A819A
	for <lists+linux-rtc@lfdr.de>; Thu,  2 Oct 2025 15:57:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 858E02367D2;
	Thu,  2 Oct 2025 15:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iitb.ac.in header.i=@iitb.ac.in header.b="veE8CEM/"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp1.iitb.ac.in (smtpd9.iitb.ac.in [103.21.126.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 602EB23815C
	for <linux-rtc@vger.kernel.org>; Thu,  2 Oct 2025 15:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.21.126.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759420758; cv=none; b=jpzvyl6LZpl/hp2ZgdRv91SXpu/hjITEN/AYxy0uM7olsf0ac9th06kuto2Ow3K0NOMkd6iVoM6m7hUiqPGanaZJEP0QBc1Fm3YJygGgbVcAe2R3Sav+aPZlpg/iveE+NyvXJadgjGSPk5PG1MmksvrUR5/8Yq3gQo03hyGxf58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759420758; c=relaxed/simple;
	bh=pU5ODyOpKgrJfAinV1dcdi2m1lpWYA3M5fMV34X7Kk8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hJ7jkTUqAlR+7DCHJ3gJg7qYan+6etBeTjoTzhib1X+3F5GJNWWClJb4N2W37XtUh+6hjN18FhXlgUZaIXszuXlZj5zpPp5vgzvbvHfun7SGxf2DU+LOeAKspmRH6Cydbe3mF1AY4XUZ+K78J/AeQC/r/qcldaJHM0pKSqzg1ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ee.iitb.ac.in; spf=pass smtp.mailfrom=ee.iitb.ac.in; dkim=pass (1024-bit key) header.d=iitb.ac.in header.i=@iitb.ac.in header.b=veE8CEM/; arc=none smtp.client-ip=103.21.126.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ee.iitb.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ee.iitb.ac.in
Received: from ldns1.iitb.ac.in (ldns1.iitb.ac.in [10.200.12.1])
	by smtp1.iitb.ac.in (Postfix) with SMTP id 4EBE210380F0
	for <linux-rtc@vger.kernel.org>; Thu,  2 Oct 2025 21:21:23 +0530 (IST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.iitb.ac.in 4EBE210380F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=iitb.ac.in; s=mail;
	t=1759420283; bh=pU5ODyOpKgrJfAinV1dcdi2m1lpWYA3M5fMV34X7Kk8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=veE8CEM/JQTrNXnNaUxSjTy3nXCrH+jcJ0yHhU9crPy+d6U4v9XY4FPPVSCuD2N2v
	 t9P63vlHiNSifeVwoolhmazII2WDJWBSLoBRnPrlD98EoMBxFnZBsBVr1HZxn/pexM
	 BzW8LKREjPKq4w2f/qk4yO/tYR0szF600Qr/C0Y8=
Received: (qmail 15111 invoked by uid 510); 2 Oct 2025 21:21:23 +0530
X-Qmail-Scanner-Diagnostics: from 10.200.1.25 by ldns1 (envelope-from <akhilesh@ee.iitb.ac.in>, uid 501) with qmail-scanner-2.11
 spamassassin: 3.4.1. mhr: 1.0. {clamdscan: 0.101.4/26439} 
 Clear:RC:1(10.200.1.25):SA:0(0.0/7.0):. Processed in 3.263975 secs; 02 Oct 2025 21:21:23 +0530
X-Spam-Level: 
X-Spam-Pyzor: Reported 0 times.
X-Envelope-From: akhilesh@ee.iitb.ac.in
X-Qmail-Scanner-Mime-Attachments: |
X-Qmail-Scanner-Zip-Files: |
Received: from unknown (HELO ldns1.iitb.ac.in) (10.200.1.25)
  by ldns1.iitb.ac.in with SMTP; 2 Oct 2025 21:21:19 +0530
Received: from bhairav.ee.iitb.ac.in (bhairav.ee.iitb.ac.in [10.107.1.1])
	by ldns1.iitb.ac.in (Postfix) with ESMTP id 7AD1A360079;
	Thu,  2 Oct 2025 21:21:19 +0530 (IST)
Received: from bhairav-test.ee.iitb.ac.in (bhairav.ee.iitb.ac.in [10.107.1.1])
	(Authenticated sender: akhilesh)
	by bhairav.ee.iitb.ac.in (Postfix) with ESMTPSA id 57BC41E814C6;
	Thu,  2 Oct 2025 21:21:19 +0530 (IST)
Date: Thu, 2 Oct 2025 21:21:14 +0530
From: Akhilesh Patil <akhilesh@ee.iitb.ac.in>
To: alexandre.belloni@bootlin.com, krzk+dt@kernel.org, robh@kernel.org,
	conor+dt@kernel.org
Cc: skhan@linuxfoundation.org, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	akhileshpatilvnit@gmail.com
Subject: Re: [PATCH v3 0/6] rtc: m41t93: add new features alarm, clock out,
 watchdog
Message-ID: <2025102-155114-838866@bhairav-test.ee.iitb.ac.in>
References: <cover.1758379856.git.akhilesh@ee.iitb.ac.in>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1758379856.git.akhilesh@ee.iitb.ac.in>

On Sat, Sep 20, 2025 at 08:30:59PM +0530, Akhilesh Patil wrote:
> This patch series adds following to m41t93 rtc driver.
> 
> Functionalities: 
> - Alarm support (support to configure alarm 1)
> - Square wave output support
> - Watchdog support
> 
> Code improvements:
> this series migrates existing driver to use standard regmap interface
> for spi instead of direct spi calls and uses regmap for new features.
> 
> Device tree support:
> Adds device tree support to the driver along with binding documentation.
> 
> Testing:
> This patch series is validated on TI am62x board with m41t93 rtc chip
> connected to spi0 bus.
> regmap migration is additionally tested by observing spi transfers
> with the help of logic analyzer. Short summary of test flow is added in
> commit message of respective features.
> 
> Datasheet:
> https://www.st.com/resource/en/datasheet/m41t93.pdf
> 
> patch 4 to 6 depend on patch 3 (regmap patch)
> 
> Signed-off-by: Akhilesh Patil <akhilesh@ee.iitb.ac.in>
> ---

Hi Alexandre, I would like to follow-up on this patch series for review
and feedback for rtc code. Let me know if any additional improvements needed.
I am willing to volunteer to support this driver in the kernel, in case
needed, as a reviewer/maintainer. I have this m41t93 RTC hardware with
me. Given we are in 6.18 merge window, looking forward for
this patch series.

Regards,
Akhilesh

> Changes in v3:
> - Address comments on bindings from Krzysztof and add myself
> as a maintainer.
> - Re-validation/testing on top of v6.17-rc6
> - Link to v2: https://lore.kernel.org/lkml/cover.1757510157.git.akhilesh@ee.iitb.ac.in/
> 
> Changes in v2:
> - Address DTS and bindings coding style feedback from Krzysztof
> - Verify bindings using $ make dt_binding_check 
> - Update example in binding documentation after testing.
> - Analyze and Fix build warnings as suggested by kernel test robot.
> - Drop patch 5 from series (device detect logic change).
>   This will be taken separately. Focus on functionalities in this series.
> - Update commit messages with short test steps for each feature.
> - Link to v1: https://lore.kernel.org/lkml/cover.1756908788.git.akhilesh@ee.iitb.ac.in/
> ---
> 
> Akhilesh Patil (6):
>   dt-bindings: rtc: Add ST m41t93
>   rtc: m41t93: add device tree support
>   rtc: m41t93: migrate to regmap api for register access
>   rtc: m41t93: Add alarm support
>   rtc: m41t93: Add square wave clock provider support
>   rtc: m41t93: Add watchdog support
> 
>  .../devicetree/bindings/rtc/st,m41t93.yaml    |  50 ++
>  drivers/rtc/rtc-m41t93.c                      | 488 ++++++++++++++++--
>  2 files changed, 486 insertions(+), 52 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/rtc/st,m41t93.yaml
> 
> -- 
> 2.34.1
> 

