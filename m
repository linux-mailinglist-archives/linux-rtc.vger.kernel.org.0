Return-Path: <linux-rtc+bounces-5665-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C05FCFD282
	for <lists+linux-rtc@lfdr.de>; Wed, 07 Jan 2026 11:26:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5C35F3010E49
	for <lists+linux-rtc@lfdr.de>; Wed,  7 Jan 2026 10:26:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98F59302176;
	Wed,  7 Jan 2026 10:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b8CryfLg"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 646ED303CB6;
	Wed,  7 Jan 2026 10:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767780933; cv=none; b=UKvMOsMSkOcDHlF0gMDFnUWX3xwiOo5HVszMomT6elqDxWPT2op6VJDmeXMWgWD2seuUdV4aMaTtnxKFd7oUbMAs7nZBrXjQ11KSthIWae3+JI2i58ftaflIjeLpzhGSK9bFOXnyEwLKk2GWhIAtHkR0TG2r1yQR5O4stApKmqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767780933; c=relaxed/simple;
	bh=aVjDuxw+m/OKIp8HwlkT/FN6fEwgIaJ/J5IwQVA4wAo=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=dB6lNHds2QnhKnYyW4BAMQIcUu1eHJmMWGEoRjoJwURpa0YXVfzZWr1MXP7lRvkLWVebg1iYXkQyt2bAoKEXAPmWI9JDHynfcdtNHkdh7VWrnKzFDxxla/7UNDyntnHK1uKzPOMOrCKo+tan8WS7RUSvnh7a7wIz49IrIAJkb+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b8CryfLg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E14AFC4CEF7;
	Wed,  7 Jan 2026 10:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767780932;
	bh=aVjDuxw+m/OKIp8HwlkT/FN6fEwgIaJ/J5IwQVA4wAo=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
	b=b8CryfLgMPv4sG0YXMXoRv3sKzPBmPNaO9xTsRIJWaER9f/M08p8x/uaosP2+Al0i
	 /urn0bouMm+u1a7QE14nuz7K0gEX7gSNEVJY37oQZ7R0i4wvaB32nmnZJD18gqBYQm
	 dyVF+bf+Jxxz8oeZmxT0Gc1Jhgt/691AgdLhDGvnAg/nghj/6DSx6+cXSihQdY2KjD
	 lsFyTo7ldYLdOXNIlaIQkYrkxo3w8iR9XLoOBJdsN7urpPzpAty5tlltmLwel3UweO
	 L3zF0UFPE4AglqD2Uz3dqmHEJCOvppF0le/llZPsai0yV4eGwGYhgx3o044o1fzFqw
	 aSupd3LkPjXcA==
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 07 Jan 2026 11:15:28 +0100
Message-Id: <DFIA1F2LOTGS.X74JYB8BB0HE@kernel.org>
To: "Dirk Behme" <dirk.behme@gmail.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [RFC PATCH v1 4/4] rust: add PL031 RTC driver
Cc: "Ke Sun" <sunke@kylinos.cn>, "Alexandre Belloni"
 <alexandre.belloni@bootlin.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun
 Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 <linux-rtc@vger.kernel.org>, <rust-for-linux@vger.kernel.org>, "Alvin Sun"
 <sk.alvin.x@gmail.com>, "Joel Fernandes" <joelagnelf@nvidia.com>,
 "Alexandre Courbot" <acourbot@nvidia.com>
References: <20260104060621.3757812-1-sunke@kylinos.cn>
 <20260104060621.3757812-5-sunke@kylinos.cn>
 <48d23334-b167-48a5-a645-28276eb85b00@gmail.com>
In-Reply-To: <48d23334-b167-48a5-a645-28276eb85b00@gmail.com>

On Sun Jan 4, 2026 at 10:02 AM CET, Dirk Behme wrote:

> Do we want a common register access style in Rust drivers and want to
> encourge using the register macro for that? Or do we take what we have
> at the moment (like here) and eventually convert later to the register
> macro? Or not? Opinions?

Yes, the idea is that drivers use the register!() macro for definitions (th=
is
has been what I am looking for since proposing it in [1]).

Please also see [2] for some more rationale and design considerations.

Ideally, we land the patch series moving the register!() macro from nova-co=
re
(which we used as a playground for development and to proof the concept) to
common infrastructure this cycle.

This way drivers targeting next cycle or later can start using it right awa=
y.

Should we not make it in this cycle, we can also consider a feature branch =
to
share with upcoming drivers, but let's see how it goes first.

> I know that it is not ready yet and still in development, but what's
> about the register!() macro [1] [2]?

As mentioned above, it's not that it is not ready. We are actively using it=
 in
nova-core for quite a while now, but we now have to move it to common
infrastructure.

It probably would have been better to do the move first and then extract ge=
neric
bitfield code afterwards, but we should be on track now. :)

- Danilo

[1] https://docs.kernel.org/gpu/nova/core/todo.html#generic-register-abstra=
ction-rega
[2] https://lore.kernel.org/all/DD15H63RK1KJ.1J584C1QC4L28@kernel.org/

