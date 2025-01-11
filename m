Return-Path: <linux-rtc+bounces-2879-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 37225A0A2BA
	for <lists+linux-rtc@lfdr.de>; Sat, 11 Jan 2025 11:24:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3BF11168752
	for <lists+linux-rtc@lfdr.de>; Sat, 11 Jan 2025 10:24:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9DA218FDC8;
	Sat, 11 Jan 2025 10:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iH5ldLsg"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C8D118787F;
	Sat, 11 Jan 2025 10:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736591080; cv=none; b=NcLmkZLSgVr+XvJAMVUWLmfybyQavXTsgABnRB6cCvSrCXkzXwzhpsUtCWTmXs1OdOFflsc4swXw/CsI2kfzq8b1HJMWbRCYzGECMiacbckhCGhSO1tHP0mSCUiawPQvZd41D2luHWmwpVgWjIryIwNFJ7Zh7cEQokl8o+Xs7QM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736591080; c=relaxed/simple;
	bh=4sB7VlhupE3rqeNJhLyFCKLxrEJPuzvs+4Y866qzT0Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T/QJadAgbQFz2VyIw+9Ap1NM/Eq5I20tjSE/0X1RPTOO9SoqiusMEQSJHMnIog2xAEvhAcU9e67fl7Gr3JAWZgCjGSQUg/M1ksNI2IgEIAYPmXqD+3IQQ10zL3bNkb8R8zCcCy9UGSwCYwWAI6Ao5e/p6Ejuu6ljdZNMoTUJljY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iH5ldLsg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 614AAC4CED2;
	Sat, 11 Jan 2025 10:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736591080;
	bh=4sB7VlhupE3rqeNJhLyFCKLxrEJPuzvs+4Y866qzT0Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iH5ldLsgqQxdGXeTULpFkUtYrJiKluAaiUGnYwQspiIDYJznI45Gy8Qq6rqJHu332
	 Ew1pkLdgh8HFfifDCljxo7y3EA3xZy/m+O116FzkGOPg+gaN2J3spvodGVKol8rYwe
	 xmQH2Ztfa0OBK/YeQ/p9WNBMVNRnRdGRgAHUhAoCBlLbcNrjTRlTD+k+aql0nc6brp
	 QHfNcRKwHRQmoB3Pai0XUUtgbFjbx9URpjz4QuK98sMV/LrSsVPgpbsiZMf++c6yFT
	 LfT6cX8pVkLuZkMX0FKSO8ohXPdrceOcNMHjEwAN8vPXDR3maAX/V8rozXhxN4XTRG
	 RaJ8kC+O1G66A==
Date: Sat, 11 Jan 2025 11:24:36 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Markus Burri <markus.burri@mt.com>
Cc: linux-kernel@vger.kernel.org, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Marek Vasut <marex@denx.de>, 
	linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, Manuel Traut <manuel.traut@mt.com>
Subject: Re: [PATCH v1 5/7] rtc-rv8803: extend sysfs to trigger internal
 ts-event
Message-ID: <tigg56hutpmaw46io6xxro65ze23oxb25rhruzarhp3bfccidz@zjiymjfbyj45>
References: <20250110061401.358371-1-markus.burri@mt.com>
 <20250110061401.358371-6-markus.burri@mt.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250110061401.358371-6-markus.burri@mt.com>

On Fri, Jan 10, 2025 at 07:13:59AM +0100, Markus Burri wrote:
> +	tmo = jiffies + msecs_to_jiffies(100); /* timeout 100ms */
> +	do {
> +		usleep_range(10, 2000);
> +		ret = rv8803_read_reg(client, RX8901_WRCMD_TRG);
> +		if (ret < 0)
> +			return ret;
> +		if (time_after(jiffies, tmo))
> +			return -EBUSY;
> +	} while (ret);
> +
> +	return count;
> +}
> +
>  static DEVICE_ATTR_WO(enable);
>  static DEVICE_ATTR_RO(read);
> +static DEVICE_ATTR_WO(trigger);

Missing ABI documentation.

Best regards,
Krzysztof


