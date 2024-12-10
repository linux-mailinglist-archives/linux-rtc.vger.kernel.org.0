Return-Path: <linux-rtc+bounces-2700-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3CC29EBEE7
	for <lists+linux-rtc@lfdr.de>; Wed, 11 Dec 2024 00:04:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AE13E283F59
	for <lists+linux-rtc@lfdr.de>; Tue, 10 Dec 2024 23:04:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A6761A9B46;
	Tue, 10 Dec 2024 23:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xj3XEYld"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 161922451C7;
	Tue, 10 Dec 2024 23:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733871876; cv=none; b=gRR8nvKal0b77lxpNJ4OEuMIGfEB2V3ncLuaAgeYo9A9M3QuF2VXCXXgpcsqrC6Y/CBhOO06SzRFonaQWlFv1wGJiohp1pUQG6D5J3LH67g6GH+Hisp6kobRmRh7iLZBOuBPmtnLna6HnmAPUw20uatmy+aiFWHgOlAT7gbc7lU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733871876; c=relaxed/simple;
	bh=xQCH/hk9rXI/a+iW/gD9HalgHRqZY+5qDViVohCJxM0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=umqA9VKBHD77SQK5mfBNeoa426v20UFQSlp7RSNrh5UWefCz4E/4s3/pwmeb9Zv5RrgGe0LQ481LPCyEWafnXZSSRnFsTQtmRAzkx/0nmtXDksDOz/2NX8Q1peyT08IeOxtgQmUc0ToB1qDMEzLXzbGO5DF5dlW6noMocMO0hxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xj3XEYld; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BDE1C4CED6;
	Tue, 10 Dec 2024 23:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733871875;
	bh=xQCH/hk9rXI/a+iW/gD9HalgHRqZY+5qDViVohCJxM0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Xj3XEYld2AI2Cm7U9K1ji/zd5s8p7v9lpfG8nUQN8gPvQLJLiDi/ZpS3BSMKRuQfn
	 7jsHvT4xWOhXCM8tmGJ9JPT3yMZGxhgFD6yPgJhqoRwrW1qPhD7FItzN/vWn47nhjI
	 VFyGeVe1Pq+1nAllJfobDOr6R9KdpCc7G44erwIfiVKf4iZBcqj+rTIcZ/Nw29U10F
	 uG3dnXhVn5kLJOohCk5azbez4ND5JHVdU76HHaSN1abBJ/ipN7pzI8gth+BP5lwaKw
	 cizgW+9FvhoLvQvy2zSLllOJaxHW6j3ByJAW05R9GLfWmjMKcYvqOJtOlBuUBTeeJV
	 ThD6hc6wkLR9A==
Date: Tue, 10 Dec 2024 17:04:33 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>
Cc: Enric Balletbo <eballetb@redhat.com>, devicetree@vger.kernel.org,
	Will Deacon <will@kernel.org>, linux-rtc@vger.kernel.org,
	Christophe Lizzi <clizzi@redhat.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>,
	Conor Dooley <conor+dt@kernel.org>, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org, Alberto Ruiz <aruizrui@redhat.com>,
	Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-arm-kernel@lists.infradead.org, NXP S32 Linux <s32@nxp.com>
Subject: Re: [PATCH v6 1/4] dt-bindings: rtc: add schema for NXP S32G2/S32G3
 SoCs
Message-ID: <173387187278.766456.7689697615269440552.robh@kernel.org>
References: <20241206070955.1503412-1-ciprianmarian.costea@oss.nxp.com>
 <20241206070955.1503412-2-ciprianmarian.costea@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241206070955.1503412-2-ciprianmarian.costea@oss.nxp.com>


On Fri, 06 Dec 2024 09:09:52 +0200, Ciprian Costea wrote:
> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> 
> RTC tracks clock time during system suspend and it is used as a wakeup
> source on S32G2/S32G3 architecture.
> 
> RTC from S32G2/S32G3 is not battery-powered and it is not kept alive
> during system reset.
> 
> Co-developed-by: Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>
> Signed-off-by: Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>
> Co-developed-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
> Signed-off-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
> Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> ---
>  .../devicetree/bindings/rtc/nxp,s32g-rtc.yaml | 72 +++++++++++++++++++
>  1 file changed, 72 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


