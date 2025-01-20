Return-Path: <linux-rtc+bounces-2963-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DABFA16F18
	for <lists+linux-rtc@lfdr.de>; Mon, 20 Jan 2025 16:15:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 09906188879C
	for <lists+linux-rtc@lfdr.de>; Mon, 20 Jan 2025 15:15:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF18B1E32B7;
	Mon, 20 Jan 2025 15:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KNTCfpah"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9262B1B6D0A;
	Mon, 20 Jan 2025 15:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737386150; cv=none; b=QoDwqQHbUULJ8ZA1x9SrKNM4+aQP/rKuUc69VYCNWIjM9O8dfQuog9mSsaTHUmDZUpL3UJKdrNcaDQuqNO2zg4OR9s4rgVaIxe6P0qrUtXdgBtWcMstVJNB4J8x6dG+lT+K9dTm+sZad50O02MOa2/nVjJ8B+MapmPqN4nBwTww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737386150; c=relaxed/simple;
	bh=rETmDDzpnx0vinAaXLMHZ7AgogsuG0sYa4PPOsnpeCw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Worbwwed07aYY87P+PwgXlDL8Fx8tfgoyM9UlVOAVyhDQ5WC698l08ZGO5K0ZmkqyZZoIBj2y3xHE1M7Jqtqv51hzzYlpGGoX5z+p8F6uoWp7MoBFzEJeIyuVPB4fu59prbh1iDAcjWs0JqzojRM1N7oyiPYG/CDxgYfflGjTtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KNTCfpah; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4362AC4CEDD;
	Mon, 20 Jan 2025 15:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737386150;
	bh=rETmDDzpnx0vinAaXLMHZ7AgogsuG0sYa4PPOsnpeCw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KNTCfpaho4DcQwRFs54Jo+m+yURXnig9XCKxWRTT/aYtYjqNFPCG+DDPFUEKQ6DuY
	 M8kXH9ohLOSec7m5iJuc5x/D/BAoYofw3RFjkOnXePE2t3vqtYw9sY1QyTgT5V3qMW
	 7qRw/P4/IBm5dizGN1464dYv7pM6gXsLwoVarcHlq8KqAOOOcPG0N/XQwNuE/ikRxv
	 oPAsXNSq5bhF+79HBmLCrG8773q7wJ1/V8VVchXUnHYinmpCDKw5U9xnKoCWjfyqqn
	 PKOju6slp2qo+4PQusp6oCpk060eBNvIkhM4Uy6AzPWndZYZSnG5SBpIu2sMTr/ov1
	 1lOPOyhUr/rSQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tZtVK-000000003hs-0xBW;
	Mon, 20 Jan 2025 16:15:54 +0100
Date: Mon, 20 Jan 2025 16:15:54 +0100
From: Johan Hovold <johan@kernel.org>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Johan Hovold <johan+linaro@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org,
	linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/7] rtc: pm8xxx: add support for uefi offset
Message-ID: <Z45oqqnlMSNEYyil@hovoldconsulting.com>
References: <20250120144152.11949-1-johan+linaro@kernel.org>
 <20250120144152.11949-4-johan+linaro@kernel.org>
 <Z45nYEfq2IPsrRy7@bogus>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z45nYEfq2IPsrRy7@bogus>

On Mon, Jan 20, 2025 at 03:10:24PM +0000, Sudeep Holla wrote:
> On Mon, Jan 20, 2025 at 03:41:48PM +0100, Johan Hovold wrote:
> > On many Qualcomm platforms the PMIC RTC control and time registers are
> > read-only so that the RTC time can not be updated. Instead an offset
> > needs be stored in some machine-specific non-volatile memory, which the
> > driver can take into account.
> > 
> > Add support for storing a 32-bit offset from the GPS time epoch in a
> > UEFI variable so that the RTC time can be set on such platforms.
> >
> 
> Why can't the UEFI runtime services be used here ?
> In short, why is drivers/rtc/rtc-efi.c not working or no attempts are
> made to check if that works just fine ?

As I alluded to in the commit message, the Qualcomm UEFI implementation
is broken and the runtime services cannot be accessed during runtime...

That's why we can't use rtc-efi and why we have a dedicated efivars
implementation that talks directly to the firmware using a custom
protocol:

	https://lore.kernel.org/all/20220723224949.1089973-1-luzmaximilian@gmail.com/

Johan

