Return-Path: <linux-rtc+bounces-5734-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 098C6D1048B
	for <lists+linux-rtc@lfdr.de>; Mon, 12 Jan 2026 02:52:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0B43D30230EE
	for <lists+linux-rtc@lfdr.de>; Mon, 12 Jan 2026 01:52:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 661F522F767;
	Mon, 12 Jan 2026 01:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="QaWpndWS"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpbg154.qq.com (smtpbg154.qq.com [15.184.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7C67B672;
	Mon, 12 Jan 2026 01:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=15.184.224.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768182731; cv=none; b=gmD1QiM/HvQsocZVOZP+jjfeyEfKtODclTs3SY9iBAe45BdwVhooeM/MBsfwZNjN2t+K6gTVsvTq4ip/UqGP+oCPuoX8PWhEDA5uVgsZw9SY6zoWDTTd6h6NOnJ9BdV7SSpIIFDbgSKVhiQWtJvDYCZOd0fx0iYA0HTp81tP7+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768182731; c=relaxed/simple;
	bh=R+GMRo3QUZPJ9JA2NR/BUVoI1i0BCUZeh7qUo9qKP5Y=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=MukFGCkXcQVh5pmxoi95n1hNumRTk14o1cQHTBwdpv1Y07GVLE6pamz7hSh2sCtd7mAaBMuXXaE236ELXAm+sPV6CrNmITtHmNJDuhElN0UXPa7u15vPip8/J0/LwFFitAk3eK/g0JPdmLjF3oRTMDwEbZFWmBQp9PHjytd25mE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=QaWpndWS; arc=none smtp.client-ip=15.184.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1768182724;
	bh=2V0YGG8KS5edIV8RrxQAVz+N/+s7k9aPRaIemnpjyes=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=QaWpndWSN74PUKyYvvxvzrfDtdd0XqDOJM9IhUuvb/CnfZxqdiBpyXLbuoxUIIyij
	 p44njcx1Vtj8RqMu42pOwATrakwQpuuecptTOX1QKfsdvRq1id92EyK4W3PzbW/NLI
	 UnaHGgR5Nes/ddfMg/9LmY5JFEGKxp0qoqiDjFVQ=
X-QQ-mid: zesmtpgz6t1768182720t29d70f31
X-QQ-Originating-IP: NgU/OvI8KlXz8Hx7N7o9ZcfY708cpKw5XNTQ/HHR3QU=
Received: from = ( [183.48.247.110])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 12 Jan 2026 09:51:58 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 5413789781877142214
EX-QQ-RecipientCnt: 13
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 12 Jan 2026 09:51:58 +0800
Message-Id: <DFM8GN2AWH1A.1FWVNVF5FLDSH@linux.spacemit.com>
Cc: "Lee Jones" <lee@kernel.org>, "Yixun Lan" <dlan@gentoo.org>, "Alex
 Elder" <elder@riscstar.com>, "Andi Shyti" <andi.shyti@kernel.org>, "Liam
 Girdwood" <lgirdwood@gmail.com>, "Mark Brown" <broonie@kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>, <linux-i2c@vger.kernel.org>,
 <linux-rtc@vger.kernel.org>
Subject: Re: [PATCH v5 1/3] regulator: spacemit: MFD_SPACEMIT_P1 as
 dependencies
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Alexandre Belloni" <alexandre.belloni@bootlin.com>, "Troy Mitchell"
 <troy.mitchell@linux.spacemit.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260108-p1-kconfig-fix-v5-0-6fe19f460269@linux.spacemit.com>
 <20260108-p1-kconfig-fix-v5-1-6fe19f460269@linux.spacemit.com>
 <20260109224147267169ba@mail.local>
In-Reply-To: <20260109224147267169ba@mail.local>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NOVhbBM8HVHMzyF6CkH+S3MOe7U+ERCsO+cWHouevEw8lKH+o0nP9d0e
	iNBSMe/Qh5CjFL5f7z9Ww2VdbH5TvXYVe+eAaEgl3utA+oQl+r/E3aCrIhKaBPw3C/buwJy
	MPTBh0Ah4RT1UPLr4LAwiTiGjpKXlAuUxa6mE0iHrMy1F6HEorDj14CMJkjfbN9K34LVjB9
	UnsZ+yoVDKb9bo+SWXMJf08KYCjjJ++ZeTNijXIw1RYThDYRLRq7LPVfgH+IxXD7y5trIyb
	TWAFdnLDLrjAeA2v0oDb25gY2EILy9pWsnjdrHBw5a6QVHodteo9wrSLPOxKFVArntkVzTq
	2jFvbOW2dGKPpjlaURT9zlFBhCDGkINmrQA3z+KN8dYfd2GNb/y32x6IW7Yj+IflfR6uAey
	7J3+Ut4MoBlTuFW2gxF6vJNwJQZGuCwnQh26+XHE1lG6/AkaG0fCAIPAmzHuxmpldjDJSs1
	mQ8H/YREWbzFJkXr1fNlFAKvVan7CdxC5PmxEQsvZFxgq/bnu7z95x3lB8mfJat7l45Uwo7
	6eXumJQNF/bgMPggxvOjpeBJbeuwLiYch+Bh3opN7fomrcnNB3k5yjtGdn2ojn3sZsPcU2/
	VUDHpxneCMrRSm3BAmaxjFXiasPjZFdX63c6VcnQmQcdo/JWRR9r2nW6qOwu6VOU+jGTjmU
	5oIX/fquxXARmgCou31WCimPXoF47z29GmYRObbxTJQh9UyhEFN3Na5J38ofbqH8zf+bZWG
	sv7NytQRj+Xp8HGlDmKidit2X+/0rc447LXqC2XI4fT8BHBGe9JAA+whKI9g8JTU/ChJ0wD
	eSX96D9D4fNpC+r8vyo/2jpgwY45oREcQiwE2LWTBJk+H6WBEFN4ZN2/sC+fb88X7g4Q8fU
	NGfvp9R1xEMY4i5Uxhxaa5bqjVQvxk1EkziuD1W6uMZl1PxM8QOJoIN+XgY0YVZfvXnIKPL
	ZwTvs4xaX6XNh/FL7kXNXyGlKrtPoe61tC1W1JQMh0LaJh9H+kDpUQVzBMQnzFlPkzVwHj7
	Jz/dAYrSPoKrAuGYol4iIO+L/a72MAm5yAhq2KmzT7ap4IUhTi8sgZf+J73/oz5ZRxv8QeT
	G2rFpCb88V/hacBqh3ncI4=
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0

On Sat Jan 10, 2026 at 6:41 AM CST, Alexandre Belloni wrote:
> On 08/01/2026 16:38:54+0800, Troy Mitchell wrote:
>> diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
>> index d2335276cce5ffbd500bbaf251d1761a9116aee9..b51888a9a78f399a6af3294f=
c19f60792576332c 100644
>> --- a/drivers/regulator/Kconfig
>> +++ b/drivers/regulator/Kconfig
>> @@ -1496,9 +1496,8 @@ config REGULATOR_SLG51000
>>  config REGULATOR_SPACEMIT_P1
>>  	tristate "SpacemiT P1 regulators"
>>  	depends on ARCH_SPACEMIT || COMPILE_TEST
>> -	depends on I2C
>> -	select MFD_SPACEMIT_P1
>> -	default ARCH_SPACEMIT
>> +	depends on MFD_SPACEMIT_P1
>> +	default m if MFD_SPACEMIT_P1
>
> default MFD_SPACEMIT_P1 is certainly enough here.
Yes, Thanks!
I'll use it in the next version.

                    - Troy


