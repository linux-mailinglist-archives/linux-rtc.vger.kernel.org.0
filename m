Return-Path: <linux-rtc+bounces-5656-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E8D6CF89BB
	for <lists+linux-rtc@lfdr.de>; Tue, 06 Jan 2026 14:52:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D2B75303F7D1
	for <lists+linux-rtc@lfdr.de>; Tue,  6 Jan 2026 13:52:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D35133A71A;
	Tue,  6 Jan 2026 13:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QhwZ0vfx"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 631FF33A714;
	Tue,  6 Jan 2026 13:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767706381; cv=none; b=lekT/gP+jORFYbI37Xu6+GvCqKB7cMURmcMh8/gyin5l3Bm8cbQxmyfccsc164rPjfeD3GeVk+QNUqXm/lfIES+7H4iog3Kt+nfC9Vf2KCE/EocvPkPT79KvhYMcT3vlqRg8Q+2vEHpsTN4veX8KAKIDDIMiqWpRUtQPJgIIpys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767706381; c=relaxed/simple;
	bh=9sq5ACv/SxacQbu8HCx4EhgIvWo56sdX1yGcs5nJRFk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=CQHPh913Iue31X9FY5vpr8lcSnysaE9MBi+x2F7HJk3D3DBVNBak81euoBInxBB8GwcVcWiiu5cEILObdvDYCg++adjwX6RodKYltVjff+HUbD2knSV/A2YNbT8IfghjosZFXxo+SJn03K75wzvb/j5TmiVhLbGQlVcoA7CIGxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QhwZ0vfx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17657C116C6;
	Tue,  6 Jan 2026 13:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767706381;
	bh=9sq5ACv/SxacQbu8HCx4EhgIvWo56sdX1yGcs5nJRFk=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=QhwZ0vfxDaEzXZGscsJB9jJBYblMpoen0OVVTJyPlPLwaLbY7lu4OTvjoFcgFqyDk
	 pENFx4Ph9t+C6NZ+1CoB97mZVCTYZCAqy1m6UcCZ2ykZyg9MsRI7lrFi4B5EXMPkd9
	 aEwFrvtGhp4hsQ2B+3Hn/7t1jrPS8TziI7UE3D/J1yAf9csNaCTQPSL5pVHl1YxbgO
	 P+PcdJ4QiuXmSngSSMynuhab/sOniBsb5gBJnRS0WoEDCbgGP48tTXbzU5iZK1ySks
	 Kh1a2smAP1DWvaJT3YOYFvrvO2Hm/b/h1kAlrkPVi7bUlcObeX046Q4cUgWUl1tRpq
	 TOaxa0pt5rsMQ==
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 06 Jan 2026 14:32:56 +0100
Message-Id: <DFHJM2HAG7Q3.1HGZ3P7H55FD2@kernel.org>
Subject: Re: [RFC PATCH v1 4/4] rust: add PL031 RTC driver
Cc: "Ke Sun" <sunke@kylinos.cn>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 "Alexandre Belloni" <alexandre.belloni@bootlin.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, <linux-rtc@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
To: "Ke Sun" <sk.alvin.x@gmail.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260104060621.3757812-1-sunke@kylinos.cn>
 <20260104060621.3757812-5-sunke@kylinos.cn>
 <DFFTVRMAFF3S.13N6WCNAVVR6I@kernel.org>
 <88b1a3dd-e646-4583-bc41-07ff7e9422a7@gmail.com>
In-Reply-To: <88b1a3dd-e646-4583-bc41-07ff7e9422a7@gmail.com>

(Cc: Greg, Rafael)

On Tue Jan 6, 2026 at 3:51 AM CET, Ke Sun wrote:
> Following the platform driver implementation, the AMBA driver stores its=
=20
> drvdata in amba_device->dev. However,
> the RTC driver also stores its drvdata in the parent device (which is=20
> also amba_device->dev), causing a conflict.

A simple driver usually has two devices to deal with:

  (1) The bus device, which represents the actual physical device sitting o=
n
      some bus, e.g. PCI or platform.

  (2) A class device, which represents the higher level functionality - i.e=
. the
      class the device belongs to - to the upper layers, e.g. RTC, DRM, PWM=
,
      etc.

The bus device does not belong to the driver per se, it only gets bound to =
a
driver.  This relationship remains until the driver itself is unregistered,=
 the
physical device falls off the bus or they are manually unbound from each ot=
her.

The driver's bus device private data only lives as long as the two are boun=
d and
the lifetime is managed by the bus abstraction, e.g. platform or AMBA.

The class device is created by the driver to represent its functionality to=
 the
upper layers; its lifetime is defined by the driver.

Other than the bus device private data, the class device private data typic=
ally
lives as long as the class device itself.

In the relationship between the two, the bus device becomes the parent devi=
ce of
the class device.

If the class device implementation guarantees that it is unregistered when =
the
parent (bus) device is unbound (which is the most common case), i.e. no mor=
e
class device callbacks happen afterwards, the abstraction can treat the par=
ent
device as &Device<Bound>, which allows drivers to directly access device
resources from the parent device without further synchronization.

The short answer for your question is, store the class device private data
within the class device itself, not within the parent device.

Alternatively, if the class device implementation does guarantee that in al=
l its
callbacks the parent device is bound, i.e. you have a &Device<Bound>, you c=
an
also access the bus device private data with Device<Bound>::drvdata().

In this case you can technically also omit having separate private data for=
 the
class device at all.

However, while this is actually been done in quite some C drivers, I do not
recommend this:

  - At least in C this can become pretty error prone, given that bus device
    resources are only valid to access as long as the device is bound to th=
e
    driver; in Rust we do protect against device resource accesses after dr=
iver
    unbind though.

  - Separating the private data properly encourages driver authors to actua=
lly
    think about ownership and lifetime of objects, eventually leading to be=
tter
    driver design.

A common pattern you will see in drivers is that the data relevant for the =
class
device goes into the class device private data and the class device itself =
is
stored within the bus device private data.

I hope this helps!

- Danilo

