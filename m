Return-Path: <linux-rtc+bounces-778-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 94C7B8716BD
	for <lists+linux-rtc@lfdr.de>; Tue,  5 Mar 2024 08:28:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 46E281F21EB3
	for <lists+linux-rtc@lfdr.de>; Tue,  5 Mar 2024 07:28:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D0E57E78A;
	Tue,  5 Mar 2024 07:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="fO4pQHDx"
X-Original-To: linux-rtc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23A624C637;
	Tue,  5 Mar 2024 07:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709623710; cv=none; b=YSt7XPGoi6ERjtnDqEBK3U273VsIMkGoyntJAGdMmkPfEP0kDm5BEXW/gdWfAEY9MkbqwDKkDX0gdZ34rm8QBiadkK9c5EpnYVdxRHwMksiu/+TQ8fMlx1bY/rtXD5G2g+eH47k1/oZotkmcDNNlcTgL+oiQFYo200NM6Zi3/sM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709623710; c=relaxed/simple;
	bh=+txbQi0PbVR84jpaqkzkIEGSXP+81Hc/076FvpmVi2M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FG5yYKguIXFICT8WNCNVZ9MX94I1AK75esL8n3tAk8EUPebuQ+OONlSTYf32nSpYV3Wd9u27LCl8KS5IRFxqjEQ9I8xHGaCFvIUS7kpCaMXSzYHysjOjiDE+aeXhb56LKC5A1YrTa60KKnsugC8QGMLVKu6ZKLSTha5+8dAeg5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=fO4pQHDx; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (89-27-53-110.bb.dnainternet.fi [89.27.53.110])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8D837CC8;
	Tue,  5 Mar 2024 08:28:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1709623687;
	bh=+txbQi0PbVR84jpaqkzkIEGSXP+81Hc/076FvpmVi2M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fO4pQHDxN/izhnSdH51t7bWsttowGYkT7/Mrldt7LEMLXy5wyLVtrMh82hBzCEAmZ
	 682clOnlmpwhdHQ7CQWOEYqzdcOZOAGCJdn+WAO2cx7pewhJRjl40eDsRyNhY5a9us
	 17Jcm4o7+UguL+7u40XCcx6tIinURzeUkgyEGc7w=
Date: Tue, 5 Mar 2024 09:28:25 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Baruch Siach <baruch@tkos.co.il>
Cc: devicetree@vger.kernel.org, linux-rtc@vger.kernel.org,
	Valentin Raevsky <valentin@compulab.co.il>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Marek Vasut <marex@denx.de>
Subject: Re: [PATCH 2/4] dt-bindings: rtc: abx80x: Convert text bindings to
 YAML
Message-ID: <20240305072825.GD12503@pendragon.ideasonboard.com>
References: <20240305004222.622-1-laurent.pinchart@ideasonboard.com>
 <20240305004222.622-3-laurent.pinchart@ideasonboard.com>
 <87jzmhthbj.fsf@tarshish>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87jzmhthbj.fsf@tarshish>

On Tue, Mar 05, 2024 at 06:46:10AM +0200, Baruch Siach wrote:
> On Tue, Mar 05 2024, Laurent Pinchart wrote:
> > Convert the abx80x DT bindings to YAML schema. The existing properties
> > are kept without modification, and the interrupt property is added as it
> > is supported by the driver.
> >
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> Done already in rtc-next:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git/commit/?id=626e2b54645a4e9b58bcb479a565b4a06ff76a26

Great :-) Thanks for the link.

-- 
Regards,

Laurent Pinchart

