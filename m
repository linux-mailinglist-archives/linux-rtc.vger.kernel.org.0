Return-Path: <linux-rtc+bounces-5658-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 57EBFCF8D64
	for <lists+linux-rtc@lfdr.de>; Tue, 06 Jan 2026 15:44:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C7577300C35B
	for <lists+linux-rtc@lfdr.de>; Tue,  6 Jan 2026 14:44:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73CE1314B6E;
	Tue,  6 Jan 2026 14:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="oziM8SXl"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A364314A6C;
	Tue,  6 Jan 2026 14:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767710685; cv=none; b=Y4K8qg6zA41sKFuqfZjfgkRSekBOJVL8sDwbkNgf7DrdigbE8m1KxtkE7+jBKjgo5UHl/4qdcKcMt38IYOQkMD/GhRvAOazAjzy3eNgH4k9TlCyvDUEjPqDfiD+dbKyLVEeRw+ZCVmnevRnGoazI/v2s+yC1V81/FCr2g+u4BeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767710685; c=relaxed/simple;
	bh=yvhMKOt2Eiw/v4wYqhtOzyHT/Ud468bQitPGH/3eqvI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZAZ2sBx1l7MCkXhxoJJ0+YIj0PTWSNezSNcn/1rH08BiTnMPzfhdJZAXkAA/hov4Fs02e7iIKsYHyAqEQTTLgg8Jco/nkPS53vFwzKyIxzc8saH/K3GI2izbKE/JVtidJEMMalEsdST2dOpsTwgLCBeD4MFWo3fy5opNFKnPnYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=oziM8SXl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54073C116C6;
	Tue,  6 Jan 2026 14:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1767710684;
	bh=yvhMKOt2Eiw/v4wYqhtOzyHT/Ud468bQitPGH/3eqvI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oziM8SXlVncr1yfjcx7kQfipzGEnqXjlOxbaVXU8OsegIUgfjr3K2VFPyJNWDcDIY
	 tQb3eZoWiBXNIplzCOfkBpQhKtuEKpKELqvbb74Y+3Ew1YTUfs0MoCG3WFwqJfUCoV
	 aPnHGS2zOa34zv+iD+1IzRcpxgO1QvLGGHNssvHk=
Date: Tue, 6 Jan 2026 15:44:41 +0100
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
Message-ID: <2026010631-verbally-probably-3ec2@gregkh>
References: <20260104060621.3757812-1-sunke@kylinos.cn>
 <20260104060621.3757812-5-sunke@kylinos.cn>
 <DFFTVRMAFF3S.13N6WCNAVVR6I@kernel.org>
 <88b1a3dd-e646-4583-bc41-07ff7e9422a7@gmail.com>
 <DFHJM2HAG7Q3.1HGZ3P7H55FD2@kernel.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DFHJM2HAG7Q3.1HGZ3P7H55FD2@kernel.org>

On Tue, Jan 06, 2026 at 02:32:56PM +0100, Danilo Krummrich wrote:
> (Cc: Greg, Rafael)
> 
> On Tue Jan 6, 2026 at 3:51 AM CET, Ke Sun wrote:
> > Following the platform driver implementation, the AMBA driver stores its 
> > drvdata in amba_device->dev. However,
> > the RTC driver also stores its drvdata in the parent device (which is 
> > also amba_device->dev), causing a conflict.

Wait, what?  That's broken in the C implementation, please, let's fix
that up now first.  drvdata is ONLY for the specific device that driver
is attached to, it can not be used by anyone else.

thanks,

greg k-h

