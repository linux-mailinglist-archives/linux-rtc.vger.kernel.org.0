Return-Path: <linux-rtc+bounces-5659-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 06109CF8F5B
	for <lists+linux-rtc@lfdr.de>; Tue, 06 Jan 2026 16:06:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6276A303EBBB
	for <lists+linux-rtc@lfdr.de>; Tue,  6 Jan 2026 15:04:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24731333447;
	Tue,  6 Jan 2026 15:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hP8EEwrQ"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF99629CE9;
	Tue,  6 Jan 2026 15:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767711846; cv=none; b=SJtncef6LlbaLE5bqAy7YNvD5mskKacGiLK5EkEvDe7pzWkz6ZFdoCfw5CPrbeZZMDM8fz4P1A2IVxCJkW1viJGQ64vabMju+rQYL8aFdTPRy4uggtxBpX7mSh2PzFZ40mxc5LEdZnLRnzk4K+wsIb8kAOUYY+bSBfje6gECu18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767711846; c=relaxed/simple;
	bh=ivmdpFuB1RtHzlfiHnxTv5WnFcWSB+rvwyrKYJ5Efzg=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=e8aPv4GLfAXZj5lf/05C1WYkkGzdRuqiNV7PZq2q4PlfS7SKDXzTLuv5l4hLAGiso3zWXoR2m8lTUw0qeG1wbHLEK3VDU42ujH18CFGoso5PtmarrnXQQ0v9kUjEK1RgKrjLRgfhCaUIv+FJ3U0fJcVcTVrKzeSoZKNJUlw+9c0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hP8EEwrQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EA74C16AAE;
	Tue,  6 Jan 2026 15:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767711845;
	bh=ivmdpFuB1RtHzlfiHnxTv5WnFcWSB+rvwyrKYJ5Efzg=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
	b=hP8EEwrQCQBrHIdHvZBpGpNMrEvrBgK2YoFDrNLFbH+oWkj6E4Ac+Z70mDYOVK1la
	 xatFKTRoSVIDC9GACpMcoDpp+RhRKsgbEfuLgIVmXanCU0vkB8ie38Clj80S6B/M5e
	 ZYf8oFj7tUpEjoXCwilJEMORqHaR55ExI97SHZTX2ZFu4Yikc/VMIOzGnY03quHZ4w
	 defsiWL6kK7OnPztrPbyHsPg1wTN8cdGEfO1TTSAyb8MkS7Cg+NEFy9etlMvK0Ybzr
	 pp3Jh7mLbVgHbF9iybPKvyCYLI4+PZuuLlOmTIM7tDHi+tdPm79cS9/mJw0N/xu/oB
	 UWI6kWqs6Etxw==
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 06 Jan 2026 16:04:00 +0100
Message-Id: <DFHLJSVBLDJS.1XEHCP2E0K47@kernel.org>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [RFC PATCH v1 4/4] rust: add PL031 RTC driver
Cc: "Ke Sun" <sk.alvin.x@gmail.com>, "Ke Sun" <sunke@kylinos.cn>, "Rafael J.
 Wysocki" <rafael@kernel.org>, "Alexandre Belloni"
 <alexandre.belloni@bootlin.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun
 Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 <linux-rtc@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
References: <20260104060621.3757812-1-sunke@kylinos.cn>
 <20260104060621.3757812-5-sunke@kylinos.cn>
 <DFFTVRMAFF3S.13N6WCNAVVR6I@kernel.org>
 <88b1a3dd-e646-4583-bc41-07ff7e9422a7@gmail.com>
 <DFHJM2HAG7Q3.1HGZ3P7H55FD2@kernel.org>
 <2026010631-verbally-probably-3ec2@gregkh>
In-Reply-To: <2026010631-verbally-probably-3ec2@gregkh>

On Tue Jan 6, 2026 at 3:44 PM CET, Greg Kroah-Hartman wrote:
> On Tue, Jan 06, 2026 at 02:32:56PM +0100, Danilo Krummrich wrote:
>> (Cc: Greg, Rafael)
>>=20
>> On Tue Jan 6, 2026 at 3:51 AM CET, Ke Sun wrote:
>> > Following the platform driver implementation, the AMBA driver stores i=
ts=20
>> > drvdata in amba_device->dev. However,
>> > the RTC driver also stores its drvdata in the parent device (which is=
=20
>> > also amba_device->dev), causing a conflict.
>
> Wait, what?  That's broken in the C implementation, please, let's fix
> that up now first.  drvdata is ONLY for the specific device that driver
> is attached to, it can not be used by anyone else.

The C RTC class device implementation passes its parent device to all its
callbacks, so the driver can obtain the device private data of the parent (=
bus)
device.

The RTC core does only provide devres guarded registration functions and do=
es
some synchronization in devm_rtc_unregister_device() [1], such that no RTC =
class
device callbacks can happen after the parent (bus) device is unbound (which=
 is
great).

So, technically it doesn't seem to be broken, but given the rationale in my
previous reply, I dislike that there is no separation of ownership and life=
time
due to not separating bus and class device private data.

[1] https://elixir.bootlin.com/linux/v6.19-rc4/source/drivers/rtc/class.c#L=
340

