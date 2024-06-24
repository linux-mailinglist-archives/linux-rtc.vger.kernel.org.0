Return-Path: <linux-rtc+bounces-1395-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 432E1914EAD
	for <lists+linux-rtc@lfdr.de>; Mon, 24 Jun 2024 15:34:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DFD371F20F80
	for <lists+linux-rtc@lfdr.de>; Mon, 24 Jun 2024 13:34:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C3C61422CD;
	Mon, 24 Jun 2024 13:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=prolan.hu header.i=@prolan.hu header.b="IboTz0Ds"
X-Original-To: linux-rtc@vger.kernel.org
Received: from fw2.prolan.hu (fw2.prolan.hu [193.68.50.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AFB41411CA;
	Mon, 24 Jun 2024 13:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.68.50.107
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719235834; cv=none; b=MqRityaFLnUVGBqzz/OHTFiu0YgSLufKFYQPsvYEawz4fY7n/ubLanoDAllZW4VlEcPhwoYybCr8NPtUAJaajYbfZSanYYnbkze8xuWOVb7Oi/DmjoWr+Hqy5f1KtAIJUCevKWO6qLk3Py3tF5x3l+rgAVkfKasfor+yaj1ED3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719235834; c=relaxed/simple;
	bh=UBleO9zGqUi+EOpv9VyXpenOVwlXiPyerA711f0tXZE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=frJH/OM9kuEZzb83hPOiDQFZWN5KJjcU0/AvfFJPk42xTbhSeP5Jhnb24oclUdTM5BGI5D0FeSuIPNicpvZeLEkXjs+75VtRFRNIz1lLoDodIgm0yhKSsJLtFCZSx7ilXDhqQOC/ydmMBKf9B9QkeR4hvwglZu25RJEb4vWkbKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=prolan.hu; spf=pass smtp.mailfrom=prolan.hu; dkim=pass (4096-bit key) header.d=prolan.hu header.i=@prolan.hu header.b=IboTz0Ds; arc=none smtp.client-ip=193.68.50.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=prolan.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=prolan.hu
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 8EA26A07A2;
	Mon, 24 Jun 2024 15:30:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=MJYDT4HIlCNB5xOSytgI
	kxpSZMauGlsPUwwfIaNASJ0=; b=IboTz0DsQN+Np2VtWClGtYdlL/zLrJfUOncI
	ekAPMzoBf5Vvt0Ezo6FYIxCouVuvVQkN7WXJKGHKjDrjcDQWgVBn2ANla0x0NfE+
	0xjr6zNUBQKBud2Kv7FY/EcS/vQ9Mg8RdCfYjsOBbCKn3We6wkCVSYLwFfbncDaJ
	QLE/iYCBGfhRHyRwenJhANWyT4NhK+VR0ggSBqoULqRdZQU5Xl1Cd8IxewmjrML4
	LyRPRooydhGRDcfY8CU8Uns0OoF7vJS6Jtjpgg7Uc5xLhYWroUT66G4FuqLpgL97
	4NRWv257uDSjeT1jycW76awYhKa9NTr5yzHdpE3HfPTilEgMPTPBif0Hgf6tetFT
	rr8jy0ihYOJwWKo3easV7QaDDlGfCPOBRbXr1t60V2KreCoRVA0b8lZGGu/fFBid
	jh92SCQf0P/ftcGy5VNNmhAjIPX8GHW3knFFINUJXK/AMI6OkHZY6HStR7gDgh3e
	CadYN56Oe5UQyMOvSUnL7nbNgkSByewqqG5AsDGVDbpILcHs+LsmcJ5MiLtYwwvW
	b1ryr16bTFHRMO8hDBS6UDSrD4TelVuEoJTHWUQLTLeyA28wjip/5EK+fursG5xJ
	zsVzDus4Zwnt3OsRWIfeuflso2G9pGNb7gk8pk+7FKAf3cCP/vHCz3uAGINkFW0a
	9Zda5DI=
Message-ID: <de896abc-aa93-4886-a414-ad992605ba91@prolan.hu>
Date: Mon, 24 Jun 2024 15:30:25 +0200
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] drivers: rtc: Add driver for SD2405AL.
To: <gomba007@gmail.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: <linux-kernel@vger.kernel.org>, <linux-rtc@vger.kernel.org>
References: <20240624-rtc-sd2405al-v4-1-2b2bc759f98f@gmail.com>
Content-Language: en-US
From: =?UTF-8?B?Q3PDs2vDoXMgQmVuY2U=?= <csokas.bence@prolan.hu>
In-Reply-To: <20240624-rtc-sd2405al-v4-1-2b2bc759f98f@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ATLAS.intranet.prolan.hu (10.254.0.229) To
 ATLAS.intranet.prolan.hu (10.254.0.229)
X-EsetResult: clean, is OK
X-EsetId: 37303A2945A129576C7665

Hi!
As per my last email,

On 6/24/24 13:25, Tóth János via B4 Relay wrote:
> From: Tóth János <gomba007@gmail.com>
> 
> Add support for the DFRobot SD2405AL I2C RTC Module.
> 
> Datasheet:
> 	https://image.dfrobot.com/image/data/TOY0021/SD2405AL%20datasheet%20(Angelo%20v0.1).pdf
> 
> Product:
> 	https://www.dfrobot.com/product-1600.html
> 
> To instantiate (assuming device is connected to I2C-1)
> as root:
> 	echo sd2405al 0x32 > /sys/bus/i2c/devices/i2c-1/new_device
> as user:
> 	echo 'sd2405al 0x32' | sudo tee /sys/class/i2c-adapter/i2c-1/new_device
> 
> The driver is tested with:
> 	+ hwclock
> 	+ tools/testing/selftests/rtc/setdate
> 	+ tools/testing/selftests/rtc/rtctest
> 
> Signed-off-by: Tóth János <gomba007@gmail.com>

Reviewed-by: Csókás, Bence <csokas.bence@prolan.hu>

 > ---
 > Changes in v4:
 > - Implement more comprehensive data validation.

BTW why did you decide to add this? Did you have problems with these 
high bits getting set?

Bence


