Return-Path: <linux-rtc+bounces-2126-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6131899675C
	for <lists+linux-rtc@lfdr.de>; Wed,  9 Oct 2024 12:33:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C280DB222DA
	for <lists+linux-rtc@lfdr.de>; Wed,  9 Oct 2024 10:33:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77EE718E743;
	Wed,  9 Oct 2024 10:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U9yR8gF3"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B94B18C34D;
	Wed,  9 Oct 2024 10:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728469997; cv=none; b=cxI6VFgumNt6ltmu9bXueK60+7ARgNhHaoEi1k5DIHTsG1IQcB25Y4qXgs6w7X7WS3VC4XnBwSrP2vDDSmt3SdZ4IXjTFDbXoBWT07s+/7xUbhkfnBlX0sSLV2yU2XSYa8N/gMIQq9I9SOwMi//89IHNNnDoyBUb1SD599LtCLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728469997; c=relaxed/simple;
	bh=E0Ok0ODNbKtR756I4dYvGK/9d++arfILtePnfodKJdw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L1MvgkB5WzGcOL/CK3Wl4zHz4qydyechI+JhnZwuLv4ftZ6dihadG5175at3oH1Hddy9IEnpQxkuekLj/IxQAY2UtP9z5MxSDWh+XhYLvWBb+Nu4D+zMsD//t9sitt4/t6cU2oc5/t8ofVaHKVnYA1PTZubyZV3OX6/VqLHrm14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U9yR8gF3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCBFCC4CEC5;
	Wed,  9 Oct 2024 10:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728469996;
	bh=E0Ok0ODNbKtR756I4dYvGK/9d++arfILtePnfodKJdw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U9yR8gF3VlvOPQ3aI/EAxJyyKxvV+0CYS69eVQISX6rszh98YeFEfYXmRw/si29IE
	 uk9S/wHJJTdavZNi1tfX6Nap9aumFFh8E0IGFs9ozGrvkta5jzNIAF21PNZ68rk98J
	 iUboYRO4b45CUR1jCtu9qwQnf9yLaHJbl5OmvxxmfwSRpSKOk1HmnWxjCMpaS/uTyx
	 vRUMdcyfxoH0io4mod0sNx8y3fH2HoNh72FipYunUsWxFEkQqb694fcUpiX5OpI9bL
	 EM0CF9K7Q6GOhxhKfzrdSgJyrjfsLGHWXvm/YYLYfPXSUuf2/kmN44FmOd3MV+FeeN
	 TWrLYW+NZwUnQ==
Date: Wed, 9 Oct 2024 11:33:07 +0100
From: Lee Jones <lee@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	matthias.bgg@gmail.com, eddie.huang@mediatek.com,
	sean.wang@mediatek.com, alexandre.belloni@bootlin.com,
	sen.chu@mediatek.com, macpaul.lin@mediatek.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-rtc@vger.kernel.org,
	kernel@collabora.com
Subject: Re: [PATCH v1 1/3] dt-bindings: mfd: mediatek: mt6397: Add
 start-year property to RTC
Message-ID: <20241009103307.GD276481@google.com>
References: <20240923100010.97470-1-angelogioacchino.delregno@collabora.com>
 <20240923100010.97470-2-angelogioacchino.delregno@collabora.com>
 <20241009101549.GB276481@google.com>
 <e0de3810-38b0-40a3-872d-678e9d4f72e5@collabora.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e0de3810-38b0-40a3-872d-678e9d4f72e5@collabora.com>

On Wed, 09 Oct 2024, AngeloGioacchino Del Regno wrote:

> Il 09/10/24 12:15, Lee Jones ha scritto:
> > On Mon, 23 Sep 2024, AngeloGioacchino Del Regno wrote:
> > 
> > > Enable evaluating the start-year property to allow shifting the
> > > RTC's HW range.
> > > 
> > > Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> > > ---
> > >   Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml | 2 ++
> > 
> > No such file.
> > 
> 
> In the cover letter, I wrote:
> 
> 
> For the bindings commit, this series goes on top of the MT6397 schema
> conversion from Macpaul Lin [1].
> 
> This series was tested on a MT8195 Cherry Tomato Chromebook.
> 
> [1]: https://lore.kernel.org/all/20240918064955.6518-1-macpaul.lin@mediatek.com/
> 
> 
> So, that's why. :-)

Nope, try again. :)

-- 
Lee Jones [李琼斯]

