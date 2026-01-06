Return-Path: <linux-rtc+bounces-5660-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F98CF9054
	for <lists+linux-rtc@lfdr.de>; Tue, 06 Jan 2026 16:18:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0725330402F6
	for <lists+linux-rtc@lfdr.de>; Tue,  6 Jan 2026 15:12:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D99A33064B;
	Tue,  6 Jan 2026 15:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="bRoCYxgQ"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 746F73126A3;
	Tue,  6 Jan 2026 15:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767712357; cv=none; b=hWb4lnMRBIgyAZCOZYe8tYFSKEK+3ZBmqdmdeChuLNAzQ5eVbsV6UHVgi4Vdcnu6x/cvu1QXidh2hKzVgL9vu+CqhswnQts8zl442BNlzZY/KH9fLOV+gpWVfuJ31tV/zSWkmGL7gL6gBGQCCtvxKPKmafZVjE+AV3hGA3DJjiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767712357; c=relaxed/simple;
	bh=CohpPFsqc+GTFPB/Yv9VIOxOrXQh5RIE/dHqFXcBtRE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jDZ6ydDHKxXpxDsLeWXAyyPMrPyPunztuOUgYWGEnRQ5QuFXqpwT4rxRPtOrzos1455XsmgCiQlzOXR9oi9Fb5vYx0W6UKXv6aZtqN64ceaU94U5WBLXYSvpvQck/fUUe3DCiktKWVSBRd8d9tJa5BGdISG4BUw8gA+uMd5ucp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=bRoCYxgQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69FEAC19423;
	Tue,  6 Jan 2026 15:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1767712357;
	bh=CohpPFsqc+GTFPB/Yv9VIOxOrXQh5RIE/dHqFXcBtRE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bRoCYxgQcO8iNIEUFDgBOuCT8b9vtzT2OiRrBMj829cMNLFycR6c2YMo/I0E2UCw6
	 Lml+Ox+2VLi+KoLnmBklVZvRtL1ST4uD1yJonHCakJDiJoocJimfTPd3OV/G8gpEzw
	 v97oBL8SL4bf4ej/E4noBBZZ2UOSoNJ3+tBWUVC8=
Date: Tue, 6 Jan 2026 16:12:33 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Ke Sun <sk.alvin.x@gmail.com>, Ke Sun <sunke@kylinos.cn>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	linux-rtc@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [RFC PATCH v1 4/4] rust: add PL031 RTC driver
Message-ID: <2026010614-sinister-lilac-f52e@gregkh>
References: <20260104060621.3757812-1-sunke@kylinos.cn>
 <20260104060621.3757812-5-sunke@kylinos.cn>
 <DFFTVRMAFF3S.13N6WCNAVVR6I@kernel.org>
 <88b1a3dd-e646-4583-bc41-07ff7e9422a7@gmail.com>
 <DFHJM2HAG7Q3.1HGZ3P7H55FD2@kernel.org>
 <2026010631-verbally-probably-3ec2@gregkh>
 <DFHLJSVBLDJS.1XEHCP2E0K47@kernel.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DFHLJSVBLDJS.1XEHCP2E0K47@kernel.org>

On Tue, Jan 06, 2026 at 04:04:00PM +0100, Danilo Krummrich wrote:
> On Tue Jan 6, 2026 at 3:44 PM CET, Greg Kroah-Hartman wrote:
> > On Tue, Jan 06, 2026 at 02:32:56PM +0100, Danilo Krummrich wrote:
> >> (Cc: Greg, Rafael)
> >> 
> >> On Tue Jan 6, 2026 at 3:51 AM CET, Ke Sun wrote:
> >> > Following the platform driver implementation, the AMBA driver stores its 
> >> > drvdata in amba_device->dev. However,
> >> > the RTC driver also stores its drvdata in the parent device (which is 
> >> > also amba_device->dev), causing a conflict.
> >
> > Wait, what?  That's broken in the C implementation, please, let's fix
> > that up now first.  drvdata is ONLY for the specific device that driver
> > is attached to, it can not be used by anyone else.
> 
> The C RTC class device implementation passes its parent device to all its
> callbacks, so the driver can obtain the device private data of the parent (bus)
> device.

Ugh :(

> The RTC core does only provide devres guarded registration functions and does
> some synchronization in devm_rtc_unregister_device() [1], such that no RTC class
> device callbacks can happen after the parent (bus) device is unbound (which is
> great).
> 
> So, technically it doesn't seem to be broken, but given the rationale in my
> previous reply, I dislike that there is no separation of ownership and lifetime
> due to not separating bus and class device private data.
> 
> [1] https://elixir.bootlin.com/linux/v6.19-rc4/source/drivers/rtc/class.c#L340

I agree, this should be fixed up somehow...

