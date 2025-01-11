Return-Path: <linux-rtc+bounces-2878-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E634A0A2B8
	for <lists+linux-rtc@lfdr.de>; Sat, 11 Jan 2025 11:24:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B0CCC3A9EAC
	for <lists+linux-rtc@lfdr.de>; Sat, 11 Jan 2025 10:24:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C5D11917D4;
	Sat, 11 Jan 2025 10:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YpjQ8tIR"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2813190051;
	Sat, 11 Jan 2025 10:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736591048; cv=none; b=ruUDrfBYVdMvKXl4qziUavl/eqFEVlvX1gIGwYbfqcYyBALxPpvavryGj1wAnEaIo4Ye9ZsPvmHNGG8LGCejElTfOpJdGenGsm0rQaODkYeBtpVwcbRSLeHKS+y6TkY06Att7me/EsP7a0rJ+fsBhFiQWj3uACCgDGPj+wJqlec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736591048; c=relaxed/simple;
	bh=3giY6bZy8v/SVulDukHGyB088CZw7hKYpi43WBKg24c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ha++C8MD3Gb1wN+gHKjI1hZx7/MdBjeJg20fkq1aRIat0cxLAohBlB0Lt4Xda7943uGSOOZSp34/202pZQfzEOUs4zFcBoa1tIDv4umWDsa5xWzegC24BNA1k0jOOVbNpT4WpZow3SnppJw+0cu7SolTXklpLnyJZhm/pmVNqdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YpjQ8tIR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39947C4CED2;
	Sat, 11 Jan 2025 10:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736591048;
	bh=3giY6bZy8v/SVulDukHGyB088CZw7hKYpi43WBKg24c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YpjQ8tIR9vqR6x0ajqS0KwAjlaTYIXfID3I3c9Ic7wpD49VFFeLFNWUKMBZWTjcnF
	 P0/XOPuevl5h3MBd/fRAREdXKRYXnRQAjT4+l7icKnRAhvOnazHlCIrFwxxOCa/3vo
	 3si/h1OttjiiO5F4uLTU6MwQWhweoiGzMj5Y6VODWXApwIiFwNoO4JJWBGb+MERAzu
	 iI0uncMWX0aTgmrmI+QNdbKTcmPDzs9dIyztzrZO3t+wQs8iiR143nkNKpw5/EpdCI
	 6YeH+2gKzEv9bRfijGwdyNtbSc1MJJ2EURAY6ZA0xnQBQ2WVhaBTbqZxVAzxMp+10k
	 cTa4taeiJBfgA==
Date: Sat, 11 Jan 2025 11:24:04 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Markus Burri <markus.burri@mt.com>
Cc: linux-kernel@vger.kernel.org, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Marek Vasut <marex@denx.de>, 
	linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, Manuel Traut <manuel.traut@mt.com>
Subject: Re: [PATCH v1 4/7] rtc-rv8803: add tamper function to sysfs for
 rv8901
Message-ID: <spr5fq42lc4qyhn35hcruficop67trmbznxel4ndibtk3yldsd@7c6ufblhbugj>
References: <20250110061401.358371-1-markus.burri@mt.com>
 <20250110061401.358371-5-markus.burri@mt.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250110061401.358371-5-markus.burri@mt.com>

On Fri, Jan 10, 2025 at 07:13:58AM +0100, Markus Burri wrote:
> +
> +static ssize_t enable_store(struct device *dev, struct device_attribute *attr, const char *buf,
> +			    size_t count)
> +{
> +	int ret;
> +	int i;
> +	unsigned long tmo;
> +	u8 reg;
> +	u8 reg_mask;
> +	struct rv8803_data *rv8803 = dev_get_drvdata(dev->parent);
> +	struct i2c_client *client = rv8803->client;
> +
> +	/* EVINxCPEN | EVINxEN */;
> +	const u8 reg_mask_evin_en = GENMASK(5, 3) | GENMASK(2, 0);
> +
> +	bool enable = (strstr(buf, "1") == buf) ? true : false;
> +
> +	guard(mutex)(&rv8803->flags_lock);


That's absolutely huge guard. Isn't this supposed to protect only flags?
Not all register writes?

> +
> +	/* check if event detection status match requested mode */
> +	ret = rv8803_read_reg(client, RX8901_EVIN_EN);
> +	if (ret < 0)
> +		return ret;

...

> +	/* re-enable interrupts */
> +	ret = rv8803_read_reg(client, RV8803_CTRL);
> +	if (ret < 0)
> +		return ret;
> +	ret = rv8803_write_reg(client, RV8803_CTRL, ret | RV8803_CTRL_EIE);
> +	if (ret < 0)
> +		return ret;
> +
> +	return offset;
> +}
> +
> +static DEVICE_ATTR_WO(enable);

You need to document the ABI.

Best regards,
Krzysztof


