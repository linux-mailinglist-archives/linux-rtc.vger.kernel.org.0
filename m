Return-Path: <linux-rtc+bounces-2128-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13E7A99679E
	for <lists+linux-rtc@lfdr.de>; Wed,  9 Oct 2024 12:48:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 31FFB1C227E4
	for <lists+linux-rtc@lfdr.de>; Wed,  9 Oct 2024 10:48:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BCF418F2C1;
	Wed,  9 Oct 2024 10:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Jt8B/gQ9"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33A7218E03E;
	Wed,  9 Oct 2024 10:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728470932; cv=none; b=XLs1nyfA17ZWkUjj1nVdh66FXVw1/f9e5PO2SmNkP4Ag5aSnibBLna6XpO/E2tC2iaJ47iOyP2s5PF7y3Uv460c7NocmZbnPuLTu60m6G1WBYnnkJuUv7q+FxJE87oNySwVkKW9t5yRYaNowl8MLMhaxtHrFHTTL0mSfA035JAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728470932; c=relaxed/simple;
	bh=wqoq0EY38rrHJ3EbOaqBkiPZGV7y8Y8pVN1jG4bIumA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=OIFWwMfHuaXPF4EQBsdfgSFJug2ycIG5SoRKThIBbsDEJU9e5jgIJo2kejOhoRc+r1KpSkjQHqjTgp8RVvQTjHKH1rVU/+viJF0bD0cJdFe5R5BLjQZEPvF7ODscX95A3+qaD4+Pg76GfrVKI+tt+91lToY/CdtHAO1qKxf+syQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=Jt8B/gQ9; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 0c5c3adc862c11ef88ecadb115cee93b-20241009
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID; bh=125oV6D49C4A1z2NuIkQKe4FP+y9yJocFdv6uX2yYjs=;
	b=Jt8B/gQ9bioKHEhXgp0OSySseHKystPjzQElXXxAXKcO1sNh372gNqsI7IKZYUe1ZUfaHlp/KTxW+KZdhnKJoq8yPziM0HAuRDwxCB2am0yHfVeH563/5L6kYjMaY4m32/1Ze1gMdbry3vq/gT4tWVuzWCAL6ruWdfcz7O80t1k=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:481b5339-5941-477e-bf56-25dd401721e8,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:13450041-8751-41b2-98dd-475503d45150,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|-5,EDM:-3,IP:ni
	l,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 1,FCT|NGT
X-CID-BAS: 1,FCT|NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 0c5c3adc862c11ef88ecadb115cee93b-20241009
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2035350135; Wed, 09 Oct 2024 18:48:41 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 9 Oct 2024 18:48:39 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.1118.26 via Frontend
 Transport; Wed, 9 Oct 2024 18:48:37 +0800
Message-ID: <9bf35a15-80ce-708d-3a45-08839edf41dc@mediatek.com>
Date: Wed, 9 Oct 2024 18:48:36 +0800
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v1 1/3] dt-bindings: mfd: mediatek: mt6397: Add start-year
 property to RTC
Content-Language: en-US
To: Lee Jones <lee@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<matthias.bgg@gmail.com>, <eddie.huang@mediatek.com>,
	<sean.wang@mediatek.com>, <alexandre.belloni@bootlin.com>,
	<sen.chu@mediatek.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-rtc@vger.kernel.org>,
	<kernel@collabora.com>
References: <20240923100010.97470-1-angelogioacchino.delregno@collabora.com>
 <20240923100010.97470-2-angelogioacchino.delregno@collabora.com>
 <20241009101549.GB276481@google.com>
 <e0de3810-38b0-40a3-872d-678e9d4f72e5@collabora.com>
 <20241009103307.GD276481@google.com> <20241009103746.GE276481@google.com>
From: Macpaul Lin <macpaul.lin@mediatek.com>
In-Reply-To: <20241009103746.GE276481@google.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--14.158500-8.000000
X-TMASE-MatchedRID: zGP2F0O7j/sOwH4pD14DsPHkpkyUphL9meN8m2FdGic3xO2R3boBWFbu
	qIY+/skQkABPgKBt/0rfEt9Ay9zO7g20q/tyc1edx6hrpRSrYiv5bNUY+JJjyA6QlBHhBZuwAr5
	mokJOphAzNhvZcetROVc3B1k53+RhemzGG4qDPakZXJLztZviXJWr6iSXWtgP+yNYYwngrxaJtv
	q2ZmkpN/CGbwGH/FjAUvthaNK4TPYYB2fOueQzj4MbH85DUZXyseWplitmp0j6C0ePs7A07cNbT
	FVOzjU8gwrmQLYen6kXt4N9KJ/nKNbV/0cyXV+n9qL5WV0e01k=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--14.158500-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP:
	1153258BB8DA91B7858CF9A1A20F13D2387AE487A4B2C14681D709B82FAE76592000:8



On 10/9/24 18:37, Lee Jones wrote:
> 	
> 
> External email : Please do not click links or open attachments until you 
> have verified the sender or the content.
> 
> On Wed, 09 Oct 2024, Lee Jones wrote:
> 
>> On Wed, 09 Oct 2024, AngeloGioacchino Del Regno wrote:
>> 
>> > Il 09/10/24 12:15, Lee Jones ha scritto:
>> > > On Mon, 23 Sep 2024, AngeloGioacchino Del Regno wrote:
>> > > 
>> > > > Enable evaluating the start-year property to allow shifting the
>> > > > RTC's HW range.
>> > > > 
>> > > > Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> > > > ---
>> > > >   Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml | 2 ++
>> > > 
>> > > No such file.
>> > > 
>> > 
>> > In the cover letter, I wrote:
>> > 
>> > 
>> > For the bindings commit, this series goes on top of the MT6397 schema
>> > conversion from Macpaul Lin [1].
>> > 
>> > This series was tested on a MT8195 Cherry Tomato Chromebook.
>> > 
>> > [1]: https://lore.kernel.org/all/20240918064955.6518-1-macpaul.lin@mediatek.com/
>> > 
>> > 
>> > So, that's why. :-)
>> 
>> Nope, try again. :)
> 
> I guess you actually mean:
> 
>    https://lore.kernel.org/all/20240918064955.6518-2-macpaul.lin@mediatek.com/
> 
> It's on my list.  I'll place yours behind it and see how we go.

Just a reminder.
The last reviewed patch set should be 'v8' because of the update for

'Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml'

[1/3] 
https://lore.kernel.org/all/20241001104145.24054-1-macpaul.lin@mediatek.com/

The [2/3] and [3/3] patches are dependent.

> 
> -- 
> Lee Jones [李琼斯]
> 

Thanks
Macpaul Lin

